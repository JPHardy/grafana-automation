from flask import Flask, jsonify
import json

app = Flask(__name__)

# Load data from JSON file
with open('data.json', 'r') as file:
    data = json.load(file)

@app.route('/users')
def get_users():
    return jsonify(data['users'])

@app.route('/metrics')
def get_metrics():
    return jsonify(data['metrics'])

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3001)

# prompts:
# - objective: cli install with image renderer
# - Format: Create a summary
# - Format: Use emojis
# - Format: one-line comment
# - Format: use markdown structure
# - Rewrite: Eliminate duplicate information