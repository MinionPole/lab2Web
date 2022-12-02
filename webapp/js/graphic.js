
function min(x, y){
    if(x < y)
        return x;
    else
        return y;
}

let stage = acgraph.create('stage-container');

let lastPoint;

let w = window.screen.availWidth * 0.4;
let h = 550;
let shagX = min(w / 10, 55);
let shagY = shagX;

let firstZone;
let thirdZone;
let secondZone;

let themain = stage.rect(0, 0, w, h);
themain.fill("#1feb6d");
//themain.fill("yellow");

function drawWithR(R){
    let realR = R * shagX;

    firstZone = stage.path().moveTo(w / 2, h / 2).lineTo(w / 2, h / 2 - realR).lineTo(w / 2 + realR, h / 2).lineTo(w / 2, h / 2);
    thirdZone = stage.rect(w/2 - realR / 2, h/2, realR / 2, realR );
    secondZone = stage.pie(w/2, h/2, realR / 2, 0, 90);

    firstZone.fill("orange");
    thirdZone.fill("orange");
    secondZone.fill("orange");
}

drawWithR(1);

function reDraw(RRR){
    firstZone.remove();
    secondZone.remove();
    thirdZone.remove();
    if(lastPoint != null){
        lastPoint.remove();
    }

    let osX = stage.path().moveTo(0, h/2).lineTo(w, h/2).close;

    let osY = stage.path().moveTo(w/2, 0).lineTo(w/2, h).close;

    for(let i = 1;;i++){
        let b = false;
        if(h / 2 + shagX * i < h){
            b = true;
            stage.path().moveTo(w/2 - shagX / 7, h / 2 + shagX * i).lineTo(w/2 + shagX / 7, h / 2 + shagX * i).close;
        }
        if(h / 2 - shagX * i > 0){
            b = true;
            stage.path().moveTo(w/2 - shagX / 7, h / 2 - shagX * i).lineTo(w/2 + shagX / 7, h / 2 - shagX * i).close;
        }

        if(w / 2 - shagX * i > 0){
            b = true;
            stage.path().moveTo(w/2 - shagX * i, h/2 - shagY / 7).lineTo(w/2 - shagX * i, h/2 + shagY / 7).close;
        }

        if(w / 2 + shagX * i < w){
            b = true;
            stage.path().moveTo(w / 2 + shagX * i, h/2 - shagY / 7).lineTo(w / 2 + shagX * i, h/2 + shagY / 7).close;
        }

        if(!b)
            break;
    }
    drawWithR(RRR);
}
reDraw(1);

document.querySelector('#selectingR').addEventListener("change", function() {
    reDraw(Number(this.value));
});

function makeLastPoint(x, y) {
    let x2 = x * shagX + w / 2;
    let y2 = -(y * shagY - h / 2);
    stage.circle(x2, y2, 5).fill("cyan");
}

stage.listen("click", function(e){
    let nowR = document.querySelector('select').value;
    let nowX = (e.clientX - w / 2) / shagX;
    let nowY = ((-e.clientY+120) + h / 2) / shagY;

    //makeLastPoint(nowX, nowY);

    let data = [new elementOfData("X", nowX), new elementOfData("Y", nowY), new elementOfData("RSelector", nowR)]
    redirectPost("/lab2/main", data)
});