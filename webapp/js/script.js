let yField;

function init(){
    yField = document.getElementById('yInputIdField');
}

function isNumber(s) {
    let n = Number(s.replace(',','.'));
    return !isNaN(n) && isFinite(n);
}

function genError(error){
    alert(error);
}

function yCheck(coordinate, min, max){
    if(coordinate.value){
        if(!isNumber(coordinate.value) || Number(coordinate.value) < min || Number(coordinate.value) > max)
            genError("некорректное значение");
        else
            return true;
    }
    else{
        genError("поле пусто");
    }
}

function radioCheck(){
    let rad=document.getElementsByName('X');
    for (let i=0;i<rad.length; i++) {
        if (rad[i].checked) {
            return true;
        }
    }
    genError("поле пусто");
    return false;
}

function getX(){
    let rad=document.getElementsByName('X');
    for (let i=0;i<rad.length; i++) {
        if (rad[i].checked) {
            return rad[i].value;
        }
    }
}

function getR(){
    let tick = document.getElementsByName('R');
    for (let i=0;i<tick.length; i++) {
        if (tick[i].checked) {
            return tick[i].value;
        }
    }
}

function RCheck(){
    let selector = document.querySelector('select');
    return selector.value != null;
}

function redirectPost(url, data) {
    let form = document.createElement('form');
    document.body.appendChild(form);
    form.method = 'post';
    form.action = url;
    for (let name in data) {
        let input = document.createElement('input');
        input.type = 'hidden';
        input.name = data[name].name;
        input.value = data[name].value;
        form.appendChild(input);
    }
    form.submit();
}



$(document).ready(function(){

    $("#parInForm").on("submit", function(event){
        event.preventDefault();
        init();
        let iscorrect = true;
        iscorect = iscorrect && RCheck();
        iscorect = iscorrect && radioCheck();
        iscorect = iscorrect && yCheck(yField, -5, 5);
        console.log("данные отправляются" );
        console.log($(this).serialize());
        if(iscorect){
            redirectPost("/lab2/main", $(this).serializeArray())
        }

    });
});

class elementOfData{
    constructor(name, value) {
        this.name = name;
        this.value = value;
    }
}


