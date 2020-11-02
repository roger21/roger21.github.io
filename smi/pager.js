/*

paginate table object v2.1 by frequency-decoder.com
http://web.archive.org/web/20130118015720/http://www.frequency-decoder.com/2007/10/19/client-side-table-pagination-script/
released under a creative commons Attribution-ShareAlike 2.5 license (http://creativecommons.org/licenses/by-sa/2.5/)
changes were made

*/
var tablePaginater = (function() {
  var tableInfo = {},
    uniqueID = 0,
    text = ["première page", "page précédente (page %p)", "page suivante (page %p)", "dernière page", "page %p sur %t", "page %p"];
  var addClass = function(e, c) {
    if(new RegExp("(^|\\s)" + c + "(\\s|$)").test(e.className)) return;
    e.className += (e.className ? " " : "") + c;
  }
  var removeClass = function(e, c) {
    e.className = !c ? "" : (e.className || "").replace(new RegExp("(^|\\s)" + c + "(\\s|$)"), " ").replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  }
  var addEvent = function(obj, type, fn) {
    if(obj.attachEvent) {
      obj["e" + type + fn] = fn;
      obj[type + fn] = function() {
        obj["e" + type + fn](window.event);
      }
      obj.attachEvent("on" + type, obj[type + fn]);
    } else {
      obj.addEventListener(type, fn, true);
    }
  }
  var removeEvent = function(obj, type, fn) {
    try {
      if(obj.detachEvent) {
        obj.detachEvent("on" + type, obj[type + fn]);
        obj[type + fn] = null;
      } else {
        obj.removeEventListener(type, fn, true);
      }
    } catch (err) {}
  }
  var init = function(tableId) {
    var tables = tableId && typeof(tableId) == "string" ? [document.getElementById(tableId)] : document.getElementsByTagName('table'),
      hook, maxPages, visibleRows, numPages, cp, cb, rowList;
    for(var t = 0, tbl; tbl = tables[t]; t++) {
      if(tbl.className.search(/paginate-([0-9]+)/) == -1) {
        continue;
      }
      if(!tbl.id) {
        tbl.id = "fdUniqueTableId_" + uniqueID++;
      }
      maxPages = tbl.className.search(/max-pages-([0-9]+)/) == -1 ? null : Number(tbl.className.match(/max-pages-([0-9]+)/)[1]);
      hook = tbl.getElementsByTagName('tbody');
      hook = (hook.length) ? hook[0] : tbl;
      visibleRows = calculateVisibleRows(hook);
      if(maxPages >= (visibleRows / Number(tbl.className.match(/paginate-([0-9]+)/)[1]))) {
        maxPages = null;
      }
      numPages = Math.ceil(visibleRows / Number(tbl.className.match(/paginate-([0-9]+)/)[1]));
      if(numPages < 2 && !(tbl.id in tableInfo)) {
        continue;
      }
      cp = (tbl.id in tableInfo) ? Math.min(tableInfo[tbl.id].currentPage, numPages) : 1;
      tableInfo[tbl.id] = {
        rowsPerPage: Number(tbl.className.match(/paginate-([0-9]+)/)[1]),
        currentPage: cp,
        totalRows: hook.getElementsByTagName('tr').length,
        hook: hook,
        maxPages: maxPages,
        numPages: numPages,
        rowStyle: tbl.className.search(/rowstyle-([\S]+)/) != -1 ? tbl.className.match(/rowstyle-([\S]+)/)[1] : false,
        callbacks: parseCallback(/^paginationcallback-/i, /paginationcallback-([\S-]+)/ig, tbl.className)
      }
      showPage(tbl.id);
      hook = null;
    }
  }
  var parseCallback = function(head, regExp, cname) {
    var cbs = [],
      matchs = cname.match(regExp),
      parts, obj, func;
    if(!matchs) {
      return [];
    }
    for(var i = 0, mtch; mtch = matchs[i]; i++) {
      mtch = mtch.replace(head, "").replace(/-/g, ".");
      try {
        if(mtch.indexOf(".") != -1) {
          parts = mtch.split('.');
          obj = window;
          for(var x = 0, part; part = obj[parts[x]]; x++) {
            if(part instanceof Function) {
              (function() {
                var method = part;
                func = function(data) {
                  method.apply(obj, [data])
                }
              })();
            } else {
              obj = part;
            }
          }
        } else {
          func = window[mtch];
        }
        if(!(func instanceof Function)) continue;
        cbs[cbs.length] = func;
      } catch (err) {}
    }
    return cbs;
  }
  var callback = function(tblId, opts) {
    if(!(tblId in tableInfo) || !(tableInfo[tblId]["callbacks"].length)) return;
    for(var i = 0, func; func = tableInfo[tblId]["callbacks"][i]; i++) {
      func(opts || {});
    }
  }
  var calculateVisibleRows = function(hook) {
    var trs = hook.rows,
      cnt = 0,
      reg = /(^|\s)invisibleRow(\s|$)/;
    for(var i = 0, tr; tr = trs[i]; i++) {
      if(tr.parentNode != hook || tr.getElementsByTagName("th").length || (tr.parentNode && tr.parentNode.tagName.toLowerCase().search(/thead|tfoot/) != -1)) continue;
      if(tr.className.search(reg) == -1) {
        cnt++;
      }
    }
    return cnt;
  }
  var createButton = function(details, ul, click) {
    var li = document.createElement("li"),
      button = document.createElement("span");
    if(click) {
      button.title = details.title;
    }
    button.className = details.className;
    ul.appendChild(li);
    li.appendChild(button);
    button.appendChild(document.createTextNode(details.text));
    if(click) {
      button.onclick = buttonClick;
    }
    li = button = null;
  }
  var removePagination = function(tableId) {
    var wrapT = document.getElementById(tableId + "-fdtablePaginaterWrapTop"),
      wrapB = document.getElementById(tableId + "-fdtablePaginaterWrapBottom");
    if(wrapT) {
      wrapT.parentNode.removeChild(wrapT);
    }
    if(wrapB) {
      wrapB.parentNode.removeChild(wrapB);
    }
  }
  var buildPagination = function(tblId) {
    if(!(tblId in tableInfo)) {
      return;
    }
    removePagination(tblId);
    var details = tableInfo[tblId];
    if(details.numPages < 2) return;

    function resolveText(txt, curr) {
      curr = curr || details.currentPage;
      return txt.replace("%p", curr).replace("%t", details.numPages);
    }
    if(details.maxPages) {
      befor = Math.floor(Number(details.maxPages - 5) / 2);
      after = Math.ceil(Number(details.maxPages - 5) / 2);
      findex = Math.max(1, Number(details.currentPage - befor));
      lindex = Math.min(details.numPages, Number(details.currentPage + after));
      if(findex < 4) {
        findex = 1;
        lindex = Number(details.maxPages - 2);
      }
      if(lindex > Number(details.numPages - 3)) {
        findex = Number(details.numPages - details.maxPages + 3);
        lindex = details.numPages;
      }
    } else {
      findex = 1;
      lindex = details.numPages;
    }
    var wrapT = document.createElement("div");
    wrapT.className = "fdtablePaginaterWrap fdtablePaginatorWrapTop";
    wrapT.id = tblId + "-fdtablePaginaterWrapTop";
    var wrapB = document.createElement("div");
    wrapB.className = "fdtablePaginaterWrap fdtablePaginatorWrapBottom";
    wrapB.id = tblId + "-fdtablePaginaterWrapBottom";
    var ulT = document.createElement("ul");
    ulT.id = tblId + "-tablePaginater";
    var ulB = document.createElement("ul");
    ulB.id = tblId + "-tablePaginaterClone";
    ulT.className = ulB.className = "fdtablePaginater";
    wrapT.appendChild(ulT);
    wrapB.appendChild(ulB);
    createButton({
      title: resolveText(text[1], details.currentPage - 1),
      className: "previous-page",
      text: "\u2039",
    }, ulT, details.currentPage != 1);
    createButton({
      title: resolveText(text[1], details.currentPage - 1),
      className: "previous-page",
      text: "\u2039",
    }, ulB, details.currentPage != 1);
    if(findex != 1) {
      createButton({
        title: text[0],
        className: "page-1",
        text: "1",
      }, ulT, true);
      createButton({
        className: "ellipsis",
        text: "\u00b7\u00b7\u00b7",
      }, ulT, false);
      createButton({
        title: text[0],
        className: "page-1",
        text: "1",
      }, ulB, true);
      createButton({
        className: "ellipsis",
        text: "\u00b7\u00b7\u00b7",
      }, ulB, false);
    }
    for(var i = findex; i <= lindex; ++i) {
      createButton({
        title: i == 1 ? text[0] : (i == details.numPages ? text[3] : resolveText(text[5], i)),
        className: i != details.currentPage ? "page-" + i : "currentPage page-" + i,
        text: i,
      }, ulT, i != details.currentPage);
      createButton({
        title: i == 1 ? text[0] : (i == details.numPages ? text[3] : resolveText(text[5], i)),
        className: i != details.currentPage ? "page-" + i : "currentPage page-" + i,
        text: i,
      }, ulB, i != details.currentPage);
    }
    if(lindex != details.numPages) {
      createButton({
        className: "ellipsis",
        text: "\u00b7\u00b7\u00b7",
      }, ulT, false);
      createButton({
        title: text[3],
        className: "page-" + details.numPages,
        text: details.numPages,
      }, ulT, true);
      createButton({
        className: "ellipsis",
        text: "\u00b7\u00b7\u00b7",
      }, ulB, false);
      createButton({
        title: text[3],
        className: "page-" + details.numPages,
        text: details.numPages,
      }, ulB, true);
    }
    createButton({
      title: resolveText(text[2], details.currentPage + 1),
      className: "next-page",
      text: "\u203a",
    }, ulT, details.currentPage != details.numPages);
    createButton({
      title: resolveText(text[2], details.currentPage + 1),
      className: "next-page",
      text: "\u203a",
    }, ulB, details.currentPage != details.numPages);
    if(document.getElementById(tblId + "-paginationListWrapTop")) {
      document.getElementById(tblId + "-paginationListWrapTop").appendChild(wrapT);
    } else {
      document.getElementById(tblId).parentNode.insertBefore(wrapT, document.getElementById(tblId));
    }
    if(document.getElementById(tblId + "-paginationListWrapBottom")) {
      document.getElementById(tblId + "-paginationListWrapBottom").appendChild(wrapB);
    } else {
      document.getElementById(tblId).parentNode.insertBefore(wrapB, document.getElementById(tblId).nextSibling);
    }
  }
  var tableSortRedraw = function(tableid, identical) {
    if(!tableid || !(tableid in fdTableSort.tableCache) || !(tableid in tableInfo)) {
      return;
    }
    var dataObj = fdTableSort.tableCache[tableid],
      data = dataObj.data,
      len1 = data.length,
      len2 = len1 ? data[0].length - 1 : 0,
      hook = dataObj.hook,
      colStyle = dataObj.colStyle,
      rowStyle = dataObj.rowStyle,
      colOrder = dataObj.colOrder,
      page = tableInfo[tableid].currentPage - 1,
      d1 = tableInfo[tableid].rowsPerPage * page,
      d2 = Math.min(tableInfo[tableid].totalRows, d1 + tableInfo[tableid].rowsPerPage),
      cnt = 0,
      rs = 0,
      reg = /(^|\s)invisibleRow(\s|$)/,
      tr, tds, cell, pos;
    for(var i = 0; i < len1; i++) {
      tr = data[i][len2];
      if(colStyle) {
        tds = tr.cells;
        for(thPos in colOrder) {
          if(!colOrder[thPos]) removeClass(tds[thPos], colStyle);
          else addClass(tds[thPos], colStyle);
        }
      }
      if(tr.className.search(reg) != -1) {
        continue;
      }
      if(!identical) {
        cnt++;
        if(cnt > d1 && cnt <= d2) {
          if(rowStyle) {
            if(rs++ & 1) addClass(tr, rowStyle);
            else removeClass(tr, rowStyle);
          }
          tr.style.display = "";
          addClass(tr, "fdTableRowVisible");
        } else {
          tr.style.display = "none";
          removeClass(tr, "fdTableRowVisible");
        }
        hook.appendChild(tr);
      }
    }
    tr = tds = hook = null;
  }
  var showPage = function(tblId, pageNum) {
    if(!(tblId in tableInfo)) {
      return;
    }
    var page = Math.max(0, !pageNum ? tableInfo[tblId].currentPage - 1 : pageNum - 1),
      d1 = tableInfo[tblId].rowsPerPage * page,
      d2 = Math.min(tableInfo[tblId].totalRows, d1 + tableInfo[tblId].rowsPerPage),
      trs = tableInfo[tblId].hook.rows,
      cnt = 0,
      rc = 0,
      len = trs.length,
      rs = tableInfo[tblId].rowStyle,
      reg = /(^|\s)invisibleRow(\s|$)/,
      row = [];
    for(var i = 0; i < len; i++) {
      if(trs[i].className.search(reg) != -1 || trs[i].getElementsByTagName("th").length || (trs[i].parentNode && trs[i].parentNode.tagName.toLowerCase().search(/thead|tfoot/) != -1)) {
        continue;
      }
      cnt++;
      if(cnt > d1 && cnt <= d2) {
        if(rs) {
          if(rc++ & 1) {
            addClass(trs[i], rs);
          } else {
            removeClass(trs[i], rs);
          }
        }
        trs[i].style.display = "";
        addClass(trs[i], "fdTableRowVisible");
        row[row.length] = trs[i];
      } else {
        trs[i].style.display = "none";
        removeClass(trs[i], "fdTableRowVisible");
      }
    }
    buildPagination(tblId);
    callback(tblId, {
      "table": tblId,
      "totalRows": len,
      "currentPage": (page + 1),
      "rowsPerPage": tableInfo[tblId].rowsPerPage,
      "visibleRows": row
    });
  }
  var buttonClick = function(e) {
    e = e || window.event;
    var span = this;
    var ul = span.parentElement.parentElement;
    var tblId = ul.id.replace("-tablePaginaterClone", "").replace("-tablePaginater", "");
    if(span.className.search("previous-page") != -1) {
      tableInfo[tblId].currentPage = Math.max(1, Number(tableInfo[tblId].currentPage - 1));
    } else if(span.className.search("next-page") != -1) {
      tableInfo[tblId].currentPage = Math.min(tableInfo[tblId].numPages, Number(tableInfo[tblId].currentPage + 1));
    } else {
      tableInfo[tblId].currentPage = parseInt(span.className.match(/page-([0-9]+)/)[1]) || 1;
    }
    showPage(tblId);
  }
  var onUnLoad = function(e) {
    var tbl, lis, pagination, uls;
    for(tblId in tableInfo) {
      uls = [tblId + "-tablePaginater", tblId + "-tablePaginaterClone"];
      for(var z = 0; z < 2; z++) {
        pagination = document.getElementById(uls[z]);
        if(!pagination) {
          continue;
        }
        lis = pagination.getElementsByTagName("li");
        for(var i = 0, li; li = lis[i]; i++) {
          li.onclick = null;
          if(li.getElementsByTagName("a").length) {
            li.getElementsByTagName("a")[0].onclick = null;
          }
        }
      }
    }
  }
  addEvent(window, "load", init);
  addEvent(window, "unload", onUnLoad);
  return {
    init: function(tableId) {
      init(tableId);
    },
    redraw: function(tableid, identical) {
      tableSortRedraw(tableid, identical);
    },
    tableIsPaginated: function(tableId) {
      return (tableId in tableInfo);
    },
    changeTranslations: function(translations) {
      text = translations;
    }
  }
})();
