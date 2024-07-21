from flask import Flask, request, jsonify
import mysql.connector
from dotenv import load_dotenv
import os

# Load the .env file
load_dotenv()

app = Flask(__name__)

# Database connection
db = mysql.connector.connect(
    host = os.getenv('HOST'), # Access the variables 
    port = os.getenv('PORT'),
    user = os.getenv('USER'),
    password = os.getenv('PASSWORD'),
    database = os.getenv('DATABASE')
)

@app.route('/')
def home():
    return "Hello, Flask!"

@app.route('/app')
def home_():
    return "Hello, MJ!"

@app.route('/add_product', methods=['POST'])
def add_product():
    data = request.json
    cursor = db.cursor()

    add_product_query = ("INSERT INTO products "
                         "(description, category, segment, manufacturer, brand, variant, type, fragrance, flavour, add_on, pack_size, package_type, barcode, image_url) "
                         "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")
    
    product_data = (
        data['item_name'], data['category'], data['segment'], data['manufacturer'], data['brand'],
        data['variant'], data['type'], data['fragrance'], data['flavour'], data['add_on'],
        data['pack_size'], data['package_type'], data['barcode'], data['image_url']
    )

    cursor.execute(add_product_query, product_data)
    db.commit()
    cursor.close()

    return jsonify({"message": "Product added successfully!"})

if __name__ == '__main__':
    app.run(debug=True)
