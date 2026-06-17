from flask import Blueprint, jsonify, request
import subprocess

main = Blueprint('main', __name__)

# VULNERABILITY 1: Hardcoded secret password (OWASP A02)
SECRET_PASSWORD = "admin123"
DB_PASSWORD = "supersecretpassword"

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

# VULNERABILITY 2: Command injection via subprocess (OWASP A03)
@main.route('/search')
def search():
    query = request.args.get('q', '')
    result = subprocess.check_output('echo ' + query, shell=True)
    return jsonify({"result": result.decode()})

# VULNERABILITY 3: Use of eval() (OWASP A03)
@main.route('/calculate')
def calculate():
    expr = request.args.get('expr', '')
    result = eval(expr)
    return jsonify({"result": result})