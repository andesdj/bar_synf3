var tiposValidos =[
  'image/jpg',
  'image/jpeg',
  'image/png',
]
function validarTIpos(file){
for(var i=0; i<tiposValidos.length;i++){
  if(file.type===tiposValidos[i]){
    return true
  }

}
return false;

}
function onChange(event){
  var file= event.target.files[0]
  if(validarTIpos(file)){
    var mini=document.getElementById('platoThumb');
        mini.src=window.URL.createObjectURL(file);
  } else {

  }
  console.log(file);
}
