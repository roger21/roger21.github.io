// ==UserScript==
// @name          phppgadmin bidouilles
// @namespace     roger21.free.fr
// @icon          http://reho.st/self/4b9dce996c4334f1c5f179c1dc183e0c56484a24.png
// @include       http://192.168.0.5/phppgadmin/sql.php*
// @grant         none
// ==/UserScript==

// $Rev: 934 $


// longueur_pseudals

// col 0 = longueur
// col 1 = nombre de comptes hfr
// col 2 = pseudal
// col 3 = profileurl

/*
var ths=document.querySelectorAll("body > table > tbody > tr > th");
for(let th of ths){
  if(th.cellIndex === 2 || th.cellIndex === 3){
    th.style.display="none";
  }
}
var tds=document.querySelectorAll("body > table > tbody > tr > td");
for(let td of tds){
  if(td.cellIndex === 2 || td.cellIndex === 3){
    td.style.display="none";
  }else if(td.cellIndex === 1){
    td.style.textAlign="right";
    if(td.nextElementSibling.textContent !== "NULL"){
      td.innerHTML="<a href=\"" + td.nextElementSibling.nextElementSibling.textContent + "\" title=\"Profil de " + td.nextElementSibling.textContent + "\">" + td.textContent + "</a>";
    }
  }
}
*/


// caracteres_pseudals

// col 0 = unicode
// col 1 = order unicode
// col 2 = UTF-8
// col 3 = order UTF-8
// col 4 = caractère
// col 5 = order caractère
// col 6 = occurence
// col 7 = nombre de pseudals
// col 8 = pseudal
// col 9 = profileurl

/*
var ths=document.querySelectorAll("body > table > tbody > tr > th");
for(let th of ths){
  if(th.cellIndex === 1 || th.cellIndex === 3 || th.cellIndex === 5 || th.cellIndex === 8 || th.cellIndex === 9){
    th.style.display="none";
  }
}
var tds=document.querySelectorAll("body > table > tbody > tr > td");
for(let td of tds){
  if(td.cellIndex === 1 || td.cellIndex === 3 || td.cellIndex === 5 || td.cellIndex === 8 || td.cellIndex === 9){
    td.style.display="none";
  }else if(td.cellIndex === 0 || td.cellIndex === 2 || td.cellIndex === 4){
    if(td.cellIndex === 4){
      td.style.textAlign="center";
    }else{
      td.style.textAlign="right";
      td.style.fontFamily="monospace";
      if(td.cellIndex === 0){
        td.innerHTML="<a href=\"https://www.fileformat.info/info/unicode/char/" + td.textContent + "/index.htm\" title=\"Fiche du carcatère sur FileFormat.Info\">" + td.textContent + "</a>";
      }
    }
    td.setAttribute("sortby", td.nextElementSibling.textContent);
  }else if(td.cellIndex === 7){
    td.style.textAlign="right";
    if(td.nextElementSibling.textContent !== "NULL"){
      td.innerHTML="<a href=\"" + td.nextElementSibling.nextElementSibling.textContent + "\" title=\"Profil de " + td.nextElementSibling.textContent + "\">" + td.textContent + "</a>";
    }
  }
}
*/


// encodage_pseudals

// col 0 = rang
// col 1 = profileurl
// col 2 = pseudal
// col 3 = pseudal_order
// col 4 = longueur
// col 5 = nombre d'octets
// col 6 = nombre d'octets de plus que de caractères
// col 7 = nombre de posts
// col 8 = dernier post avant la collecte

/*
var ths=document.querySelectorAll("body > table > tbody > tr > th");
for(let th of ths){
  if(th.cellIndex === 1 || th.cellIndex === 3){
    th.style.display="none";
  }
}
var tds=document.querySelectorAll("body > table > tbody > tr > td");
for(let td of tds){
  if(td.cellIndex === 1 || td.cellIndex === 3){
    td.style.display="none";
  }else if(td.cellIndex === 2){
    td.style.textAlign="center";
    td.innerHTML="<a href=\"" + td.previousElementSibling.textContent + "\" title=\"Profil de " + td.textContent + "\">" + td.textContent + "</a>";
    td.setAttribute("sortby", td.nextElementSibling.textContent);
  }else if(td.cellIndex === 8){
    td.style.textAlign="right";
    if(td.textContent === "NULL"){
      td.setAttribute("sortby", "-1");
      td.textContent=" - ";
    }else{
      td.setAttribute("sortby", td.textContent);
      td.textContent=td.textContent === "0" || td.textContent === "1" ? "il y a " + td.textContent + " jour" : "il y a " + td.textContent + " jours";
    }
  }
}
*/


// taupe_mille_posteurs

// col 0 = rang
// col 1 = profileurl
// col 2 = pseudal
// col 3 = pseudal_order
// col 4 = nombre de posts
// col 5 = dernier post avant la collecte

/*
var ths=document.querySelectorAll("body > table > tbody > tr > th");
for(let th of ths){
  if(th.cellIndex === 1 || th.cellIndex === 3){
    th.style.display="none";
  }
}
var tds=document.querySelectorAll("body > table > tbody > tr > td");
for(let td of tds){
  if(td.cellIndex === 1 || td.cellIndex === 3){
    td.style.display="none";
  }else if(td.cellIndex === 2){
    td.setAttribute("sortby", td.nextElementSibling.textContent);
    td.style.textAlign="center";
    td.innerHTML="<a href=\"" + td.previousElementSibling.textContent + "\" title=\"Profil de " + td.textContent + "\">" + td.textContent + "</a>";
  }else if(td.cellIndex === 5){
    td.style.textAlign="right";
    td.setAttribute("sortby", td.textContent);
    td.textContent=td.textContent === "0" || td.textContent === "1" ? "il y a " + td.textContent + " jour" : "il y a " + td.textContent + " jours";
  }
}
*/


// taupe_cinq_cent_villes

// col 0 = rang
// col 1 = ville
// col 2 = ville_order
// col 3 = pseudal_order
// col 4 = nombre de comptes hfr
// col 5 = nombre de comptes hfr actifs en 2019

/*
var ths=document.querySelectorAll("body > table > tbody > tr > th");
for(let th of ths){
  if(th.cellIndex === 2){
    th.style.display="none";
  }
}
var tds=document.querySelectorAll("body > table > tbody > tr > td");
for(let td of tds){
  if(td.cellIndex === 2){
    td.style.display="none";
  }else if(td.cellIndex === 1){
    td.setAttribute("sortby", td.nextElementSibling.textContent);
    td.style.textAlign="center";
  }
}
*/


// statuts_immoderes

// col 0 = profileurl
// col 1 = pseudal
// col 2 = pseudal_order
// col 3 = statut
// col 4 = nombre de posts
// col 5 = dernier post avant la collecte

/*
var ths=document.querySelectorAll("body > table > tbody > tr > th");
for(let th of ths){
  if(th.cellIndex === 0 || th.cellIndex === 2){
    th.style.display="none";
  }
}
var tds=document.querySelectorAll("body > table > tbody > tr > td");
for(let td of tds){
  if(td.cellIndex === 0 || td.cellIndex === 2){
    td.style.display="none";
  }else if(td.cellIndex === 1){
    td.setAttribute("sortby", td.nextElementSibling.textContent);
    td.style.textAlign="center";
    td.innerHTML="<a href=\"" + td.previousElementSibling.textContent + "\" title=\"Profil de " + td.textContent + "\">" + td.textContent + "</a>";
  }else if(td.cellIndex === 5){
    td.style.textAlign="right";
    if(td.textContent === "NULL"){
      td.setAttribute("sortby", "-1");
      td.textContent=" - ";
    }else{
      td.setAttribute("sortby", td.textContent);
      td.textContent=td.textContent === "0" || td.textContent === "1" ? "il y a " + td.textContent + " jour" : "il y a " + td.textContent + " jours";
    }
  }
}
*/
