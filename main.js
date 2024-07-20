document.getElementById('add-product-form').addEventListener('submit', function(event) {
    event.preventDefault();

    let product = {
        item_name: document.getElementById('item_name').value,
        category: document.getElementById('category').value,
        segment: document.getElementById('segment').value,
        manufacturer: document.getElementById('manufacturer').value,
        brand: document.getElementById('brand').value,
        variant: document.getElementById('variant').value,
        type: document.getElementById('type').value,
        fragrance: document.getElementById('fragrance').value,
        flavour: document.getElementById('flavour').value,
        add_on: document.getElementById('add_on').value,
        pack_size: document.getElementById('pack_size').value,
        package_type: document.getElementById('package_type').value,
        barcode: document.getElementById('barcode').value,
        image_url: document.getElementById('image_url').value
    };

    addProductToList(product);
    document.getElementById('add-product-form').reset();
});

function addProductToList(product) {
    let productList = document.getElementById('products');
    let productItem = document.createElement('div');
    productItem.className = 'product-item';
    productItem.innerHTML = `
        <h3>${product.item_name}</h3>
        <p><strong>Category:</strong> ${product.category}</p>
        <p><strong>Segment:</strong> ${product.segment}</p>
        <p><strong>Manufacturer:</strong> ${product.manufacturer}</p>
        <p><strong>Brand:</strong> ${product.brand}</p>
        <p><strong>Variant:</strong> ${product.variant}</p>
        <p><strong>Type:</strong> ${product.type}</p>
        <p><strong>Fragrance:</strong> ${product.fragrance}</p>
        <p><strong>Flavour:</strong> ${product.flavour}</p>
        <p><strong>Add-On:</strong> ${product.add_on}</p>
        <p><strong>Pack Size:</strong> ${product.pack_size}</p>
        <p><strong>Package Type:</strong> ${product.package_type}</p>
        <p><strong>Barcode:</strong> ${product.barcode}</p>
        <p><strong>Image URL:</strong> ${product.image_url}</p>
    `;
    productList.appendChild(productItem);
}
