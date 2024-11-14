window.addEventListener("DOMContentLoaded", function() {

  const fr = {
    "warning": "Attention : la génération de la fractale peut figer votre navigateur, particulièrement si la fenêtre de votre navigateur dépasse le Full HD (1920 x 1080) ou si votre processeur est lent. Dans ces cas préférez le mode « step » et / ou réduisez la fenêtre de votre navigateur.",
    "always": "Je veux toujours figer mon navigateur.",
    "cancel": "Ok, laisse tomber.",
    "letsgo": "Je veux figer mon navigateur.",
  };
  const indexEn = navigator.languages.findIndex(lang =>
    lang.toLowerCase().split("-")[0] === "en");
  const indexFr = navigator.languages.findIndex(lang =>
    lang.toLowerCase().split("-")[0] === "fr");
  const lang = ((indexEn !== -1 && indexEn < indexFr) || indexFr === -1) ?
        "en" : "fr";
  if(lang === "fr" /*&& false*/){
    document.querySelectorAll("[data-lang]").forEach((e) => {
      e.firstChild.textContent = fr[e.getAttribute("data-lang")];
    });
  }

  const body = document.body;
  const canvas = document.getElementById("fract");
  const fract = canvas.getContext("2d", {
    alpha: true,
    desynchronized: true,
  });
  const steps = document.querySelector("body > span#steps");
  const start = document.querySelector("body form span#start");
  const stop = document.querySelector("body form span#stop");
  const clear = document.querySelector("body form span#clear");
  const dialog = document.querySelector("body dialog#warning");
  const always = document.querySelector("body dialog#warning input#always");
  const cancel = document.querySelector("body dialog#warning span#cancel");
  const letsgo = document.querySelector("body dialog#warning span#letsgo");
  let stopping = false;
  let working = false;
  let reseting = false;
  let alwaysFreeze = false;
  let width, height;

  stop.addEventListener("click", function() {
    console.log("fract.js stopping");
    stopping = true;
  }, false);

  function setCanvaSize() {
    if(working) {
      reseting = true;
      console.log("fract.js reseting setCanvaSize");
      return;
    }
    console.log("fract.js setCanvaSize");
    width = body.clientWidth - 60;
    height = body.clientHeight - 60;
    canvas.setAttribute("width", width);
    canvas.setAttribute("height", height);
    tortue.reset();
    let inputs = document.getElementsByTagName("input");
    for(let i = 0; i < inputs.length; ++i) {
      inputs.item(i).checked = false;
      inputs.item(i).disabled = false;
    }
    steps.textContent = "";
    body.classList.toggle("work", false);
    start.classList.toggle("startable", false);
    stop.classList.toggle("stoppable", false);
    body.classList.toggle("clean", true);
    stopping = false;
    working = false;
    reseting = false;
  }
  window.addEventListener("resize", () => {
    alwaysFreeze = false;
    setCanvaSize();
  }, false);
  clear.addEventListener("click", setCanvaSize, false);

  let tortue = {
    angle: 0,
    posx: 0,
    posy: 0,

    reset: function() {
      fract.restore();
      fract.save();
      fract.reset();
      fract.clearRect(0, 0, width, height);
      fract.translate(0.5, 0.5);
      fract.strokeStyle = "rgba(0, 0, 0, 1)";
      fract.shadowColor = "rgba(0, 0, 0, 0)";
      fract.shadowBlur = 0;
      this.angle = 0;
      this.posx = 0;
      this.posy = 0;
    },

    color: function(stroke, shadow, blur) {
      fract.strokeStyle = stroke;
      fract.shadowColor = shadow;
      fract.shadowBlur = blur;
    },

    turn: function(side, angle) {
      if(typeof angle === "number" && angle > 0 && angle <= 180) {
        if(side === "right") {
          this.angle = (this.angle - angle);
          if(this.angle < -180) {
            this.angle += 360;
          }
        } else if(side === "left") {
          this.angle = (this.angle + angle);
          if(this.angle > 180) {
            this.angle -= 360;
          }
        }
      }
    },

    draw: function(length) {
      if(typeof length === "number" && length > 0) {
        fract.beginPath();
        fract.moveTo(this.posx, this.posy);
        let angle = this.angle * Math.PI / 180;
        this.posx += Math.cos(angle) * length;
        this.posy -= Math.sin(angle) * length;
        fract.lineTo(this.posx, this.posy);
        fract.stroke();
      }
    },

    back: function(length) {
      if(typeof length === "number" && length > 0) {
        let angle = this.angle / 180 * Math.PI
        this.posx -= Math.cos(angle) * length;
        this.posy += Math.sin(angle) * length;
        fract.moveTo(this.posx, this.posy);
      }
    },

    move: function(posx, posy) {
      if(typeof posx === "number" && posx >= 0 &&
        typeof posy === "number" && posy >= 0) {
        this.posx = posx;
        this.posy = posy;
      }
    },
  };

  let fractals = {
    step: false,
    shadow: false,
    minSize: 1,
    animeStep: null,
    animeOver: false,
    animeDelay: 500,
    current: "",

    kochLine: function(size, step) {
      //console.log("fract.js kochLine", step, size);
      if(size < fractals.minSize || step === 0) {
        if(size < fractals.minSize) {
          fractals.animeOver = true;
        }
        tortue.draw(size);
        return;
      }
      fractals.kochLine(size / 3, step - 1);
      tortue.turn("left", 60);
      fractals.kochLine(size / 3, step - 1);
      tortue.turn("right", 120);
      fractals.kochLine(size / 3, step - 1);
      tortue.turn("left", 60);
      fractals.kochLine(size / 3, step - 1);
    },

    kochStepDelay: function(size, x, y) {
      console.log("fract.js kochStepDelay", fractals.animeStep);
      return new Promise(function(resolve) {
        window.setTimeout(function() {
          fractals.kochStep(size, x, y);
          resolve();
        }, fractals.animeDelay);
      });
    },

    kochStep: async function(size, x, y) {
      if(stopping) {
        fractals.animeOver = true;
        steps.textContent = "stopped at step " +
          (steps.textContent || "0");
        console.log("fract.js stopping kochStep", fractals.animeStep);
      } else {
        console.log("fract.js kochStep", fractals.animeStep);
        tortue.reset();
        tortue.color("rgba(255, 0, 0, 1)",
          fractals.shadow ? "rgba(0, 0, 255, 0.5)" : "rgba(0, 0, 0, 0)",
          fractals.shadow ? 5 : 0);
        tortue.move(x, y);
        fractals.kochLine(size, fractals.animeStep);
        tortue.turn("right", 120);
        fractals.kochLine(size, fractals.animeStep);
        tortue.turn("right", 120);
        fractals.kochLine(size, fractals.animeStep);
        steps.textContent = (fractals.animeStep + 1);
      }
      if(!fractals.animeOver) {
        ++fractals.animeStep;
        await fractals.kochStepDelay(size, x, y);
      } else {
        enableInputs();
      }
    },

    koch: async function() {
      console.log("fract.js koch");
      let size = Math.round(Math.min(width,
        height / (((Math.sqrt(3) * 4) / 2) / 3)) * .9);
      let x = Math.round((width - size) / 2);
      let y = Math.round(((height - (size *
          (((Math.sqrt(3) * 4) / 2) / 3))) / 2) +
        (size * ((Math.sqrt(3) / 2) / 3)));
      let maxStep = 0;
      let s = size;
      while(s >= fractals.minSize) {
        ++maxStep;
        s = s / 3;
      }
      console.log("fract.js koch maxStep", maxStep);
      if(fractals.step) {
        fractals.animeStep = 0; // 0 here
        fractals.animeOver = false;
      } else {
        fractals.animeStep = maxStep;
        fractals.animeOver = true;
      }
      steps.textContent = "";
      await fractals.kochStepDelay(size, x, y);
    },

    treeLine: function(size, angle1, angle2, factor1, factor2, step) {
      //console.log("fract.js treeLine", step, size);
      if(size < fractals.minSize || step === 0) {
        if(size < fractals.minSize) {
          fractals.animeOver = true;
        }
        return;
      }
      tortue.draw(size);
      tortue.turn("right", angle1);
      fractals.treeLine(size * factor1,
        angle1, angle2, factor1, factor2, step - 1);
      tortue.turn("left", angle1 + angle2);
      fractals.treeLine(size * factor2,
        angle1, angle2, factor1, factor2, step - 1);
      tortue.turn("right", angle2);
      tortue.back(size);
    },

    treeStepDelay: function(size, angle1, angle2, factor1, factor2, x, y) {
      console.log("fract.js treeStepDelay", fractals.animeStep);
      return new Promise(function(resolve) {
        window.setTimeout(function() {
          fractals.treeStep(size, angle1, angle2, factor1, factor2, x, y);
          resolve();
        }, fractals.animeDelay);
      });
    },

    treeStep: async function(size, angle1, angle2, factor1, factor2, x, y) {
      if(stopping) {
        fractals.animeOver = true;
        steps.textContent = "stopped at step " +
          (steps.textContent || "0");
        console.log("fract.js stopping treeStep", fractals.animeStep);
      } else {
        console.log("fract.js treeStep", fractals.animeStep);
        tortue.reset();
        tortue.color("rgba(255, 0, 0, 1)",
          fractals.shadow ? "rgba(0, 0, 255, 0.5)" : "rgba(0, 0, 0, 0)",
          fractals.shadow ? 5 : 0);
        tortue.move(x, y);
        tortue.turn("left", 90);
        fractals.treeLine(size, angle1, angle2,
          factor1, factor2, fractals.animeStep);
        steps.textContent = fractals.animeStep;
      }
      if(!fractals.animeOver) {
        ++fractals.animeStep;
        await fractals.treeStepDelay(size,
          angle1, angle2, factor1, factor2, x, y);
      } else {
        enableInputs();
      }
    },

    tree: async function() {
      console.log("fract.js tree");
      // 5.65 4.49 2.00 are magic numbers for
      // angles 25 and 15 and factors 0.85 and 0.75
      let size = Math.round(Math.min(width * .9 / 5.65, height * .9 / 4.49));
      let angle1 = 25;
      let angle2 = 15;
      let factor1 = 0.85;
      let factor2 = 0.75;
      let x = Math.round(((width - (size * 5.65)) / 2) + (size * 2.00));
      let y = Math.round(((height - (size * 4.49)) / 2) + (size * 4.49));
      let maxStep = 0;
      let s = size;
      let f = Math.min(factor1, factor2);
      while(s >= fractals.minSize) {
        ++maxStep;
        s = s * f;
      }
      console.log("fract.js tree maxStep", maxStep);
      if(fractals.step) {
        fractals.animeStep = 1; // 1 here
        fractals.animeOver = false;
      } else {
        fractals.animeStep = maxStep;
        fractals.animeOver = true;
      }
      steps.textContent = "";
      await fractals.treeStepDelay(size,
        angle1, angle2, factor1, factor2, x, y);
    },

    drgnLine: function(size, step, side) {
      //console.log("fract.js drgnLine", step, side, size);
      if(size < fractals.minSize || step === 0) {
        if(size < fractals.minSize) {
          fractals.animeOver = true;
        }
        tortue.draw(size);
        return;
      }
      if(side === "left") {
        tortue.turn("left", 45);
        fractals.drgnLine(Math.sqrt(2) * size / 2, step - 1, "left");
        tortue.turn("right", 90);
        fractals.drgnLine(Math.sqrt(2) * size / 2, step - 1, "right");
      } else {
        fractals.drgnLine(Math.sqrt(2) * size / 2, step - 1, "left");
        tortue.turn("left", 90);
        fractals.drgnLine(Math.sqrt(2) * size / 2, step - 1, "right");
        tortue.turn("right", 45);
      }
    },

    drgnStepDelay: function(size, x, y) {
      console.log("fract.js drgnStepDelay", fractals.animeStep);
      return new Promise(function(resolve) {
        window.setTimeout(function() {
          fractals.drgnStep(size, x, y);
          resolve();
        }, fractals.animeDelay);
      });
    },

    drgnStep: async function(size, x, y) {
      if(stopping) {
        fractals.animeOver = true;
        steps.textContent = "stopped at step " +
          (steps.textContent || "0");
        console.log("fract.js stopping drgnStep", fractals.animeStep);
      } else {
        console.log("fract.js drgnStep", fractals.animeStep);
        tortue.reset();
        tortue.color("rgba(255, 0, 0, 1)",
          fractals.shadow ? "rgba(0, 0, 255, 0.5)" : "rgba(0, 0, 0, 0)",
          fractals.shadow ? 5 : 0);
        tortue.move(x, y);
        fractals.drgnLine(size, fractals.animeStep, "left");
        steps.textContent = (fractals.animeStep + 1);
      }
      if(!fractals.animeOver) {
        ++fractals.animeStep;
        await fractals.drgnStepDelay(size, x, y);
      } else {
        enableInputs();
      }
    },

    drgn: async function() {
      console.log("fract.js drgn");
      let size = Math.round(Math.min(width / 1.5, height) * .9);
      let x = Math.round(((width - (size * 1.5)) / 2) + (size / 3));
      let y = Math.round(((height - size) / 2) + (2 * size / 3));
      let maxStep = 0;
      let s = size;
      while(s >= fractals.minSize) {
        ++maxStep;
        s = Math.sqrt(2) * s / 2;
      }
      console.log("fract.js drgn maxStep", maxStep);
      if(fractals.step) {
        fractals.animeStep = 0; // 0 here
        fractals.animeOver = false;
      } else {
        fractals.animeStep = maxStep;
        fractals.animeOver = true;
      }
      steps.textContent = "";
      await fractals.drgnStepDelay(size, x, y);
    },
  };

  function isStartable() {
    let isit = false;
    let inputs = document.getElementsByName("fractal");
    for(let i = 0; i < inputs.length; ++i) {
      if(inputs.item(i).checked) {
        isit = true;
        break;
      }
    }
    start.classList.toggle("startable", isit);
  }
  let inputs = document.getElementsByTagName("input");
  for(let i = 0; i < inputs.length; ++i) {
    inputs.item(i).addEventListener("change", isStartable, false);
  }

  function disableInputs(disable = true) {
    let inputs = document.getElementsByTagName("input");
    for(let i = 0; i < inputs.length; ++i) {
      inputs.item(i).disabled = disable;
    }
    body.classList.toggle("work", true);
    start.classList.toggle("startable", false);
    if(fractals.step) {
      stop.classList.toggle("stoppable", true);
    }
    working = true;
  }

  function enableInputs() {
    disableInputs(false);
    body.classList.toggle("work", false);
    start.classList.toggle("startable", true);
    stop.classList.toggle("stoppable", false);
    body.classList.toggle("clean", false);
    stopping = false;
    working = false;
    if(reseting) {
      setCanvaSize();
    }
  }

  function startDraw() {
    console.log("fract.js startDraw");
    disableInputs();
    tortue.reset();
    fractals[fractals.current]();
  }

  cancel.addEventListener("click", () => {
    dialog.close();
  }, false);

  letsgo.addEventListener("click", () => {
    alwaysFreeze = always.checked;
    dialog.close();
    startDraw();
  }, false);

  function drawFractal() {
    console.log("fract.js drawFractal");
    fractals.step = document.getElementById("step").checked;
    fractals.shadow = document.getElementById("shdw").checked;
    let inputs = document.getElementsByName("fractal");
    for(let i = 0; i < inputs.length; ++i) {
      if(inputs.item(i).checked) {
        fractals.current = inputs.item(i).value;
        if(!fractals.step && !alwaysFreeze) {
          always.checked = false;
          dialog.showModal();
        } else {
          startDraw();
        }
        break;
      }
    }
  }
  start.addEventListener("click", drawFractal, false);

  setCanvaSize();

}, false);