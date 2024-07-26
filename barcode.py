# THIS IS A PYTHON CODE FOR WRITING BARCODES FOR THE PRODUCTS

import warnings
warnings.filterwarnings('ignore')
import mysql.connector  # connects our model to the mysql database
import hashlib   # we will use it to generate hashtags for our database

# Function to generate a consistent barcode based on product attributes
def generate_barcode(product):
    attributes = f"{product['ITEM_NAME']}_{product['category']}_{product['manufacturer']}"
    barcode = hashlib.md5(attributes.encode()).hexdigest()[:12]  # Take first 12 characters of MD5 hash
    return barcode

# Connect to the MySQL database
import os
# Database connection
connection = mysql.connector.connect(
    host = os.getenv('HOST'), # Access the variables 
    port = os.getenv('PORT'),
    user = os.getenv('USER'),
    password = os.getenv('PASSWORD'),
    database = os.getenv('DATABASE')
)

# Create a cursor object
cursor = connection.cursor(dictionary=True)

# Retrieve products without barcodes
cursor.execute('SELECT * FROM products WHERE barcode IS NULL')
products = cursor.fetchall()

# Generate barcodes for products without barcodes
for product in products:
    barcode = generate_barcode(product)
    product_id = product['products_id']
    
    # Update the product with the generated barcode
    cursor.execute(
        'UPDATE products SET barcode = %s WHERE products_id = %s',
        (barcode, product_id)
    )

# Commit the changes to the database
connection.commit()

# Close the cursor and connection
cursor.close()
connection.close()

print("Barcodes generated and updated successfully.")
