from main import app


def test_hello_world():
    with app.test_client() as client:
        response = client.get("/hello/your%20name")
        assert response.status_code == 200
        assert response.json == {"message": "Hello, Your Name!"}
