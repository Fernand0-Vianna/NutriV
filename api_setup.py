from flask import Flask

app = Flask(__name__)

# Adicione suas APIs aqui
@app.route('/api/example', methods=['GET'])
def example_api():
    return {"message": "API funcionando corretamente"}

if __name__ == '__main__':
    app.run(debug=True)