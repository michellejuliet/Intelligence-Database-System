document.addEventListener('DOMContentLoaded',(event) =>{

const addButton = document.querySelector('.add-button');

function fetchData(){
 fetch('http://localhost:3000/products')
 .then((resp) =>resp.json())
  .then((data) => console.log(data));

}
fetchData();

addButton.addEventListener('click', addProduct);
function  addProduct(){
 alert("Item added successfuly");
}


document.getElementById('add-product-form').addEventListener('submit',function(event){
  console.log(event);
  event.preventDefault();
  
const itemName= document.getElementById('item-name').value;
const category = document.getElementById('category').value;
const segment = document.getElementById('segment').value;
const manufacturer = document.getElementById('manufacturer'). value;
const brand = document.getElementById('brand').value;
const variant = document.getElementById('variant').value;
const type = document.getElementById('type').value;
const fragrance = document.getElementById('fragrance').value;
const flavour = document.getElementById('flavour').value;
const addOn = document.getElementById('add-On').value;
const packSize = document.getElementById('pack-size').value;
const packageType = document.getElementById('package-type').value;
const barCode = document.getElementById('barcode').value;
const imageUrl = document.getElementById('image-url').value;


const data = {itemName, category,segment,manufacturer,brand,variant,type,fragrance,flavour,addOn,packSize, packageType, barCode,imageUrl};

//we now update the DOM
const productList = document.getElementById('products');
const newDataDiv = document.createElement('div');
newDataDiv.textContent = `itemName: ${itemName}, category: ${category}, segment:${segment}, manufacturer:${manufacturer}, brand:${brand},
 variant:${variant}, type:${type}, fragrance:${fragrance}, flavour:${flavour}, addOn:${addOn}, packSize:${packSize}, packageType:${packageType},
 barCode:${barCode}, imageUrl:${imageUrl}`;
productList.appendChild(newDataDiv);


//updating data in json
fetch('http://localhost:3000/products',{
 method: 'POST',
 headers:{
   'content-Type': 'application/json'
 },
 body: JSON.stringify(data)
})
.then(resp => resp.json())
.then(data => console.log('success:',data))
.catch((error) =>{
 console.error('Error:', error);
});
})


})