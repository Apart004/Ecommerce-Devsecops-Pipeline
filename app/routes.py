from flask import Blueprint, jsonify

main = Blueprint('main', __name__)

@main.route('/')
def home():
    return jsonify({
        "message": "Welcome to E-Commerce API",
        "status": "running"
    })

@main.route('/products')
def products():
    products_list = [
        {"id": 1, "name": "Laptop", "price": 999.99},
        {"id": 2, "name": "Phone", "price": 499.99},
        {"id": 3, "name": "Headphones", "price": 99.99}
    ]
    return jsonify(products_list)

@main.route('/health')
def health():
    return jsonify({"status": "healthy"})