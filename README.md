# Devise-API

Curl Command to test API

Create:
curl -H "Content-Type: application/json" -d '{"fields":{"email":"your@email.com","password":"your_password","password_confirmation":"your_password"}}' -X POST http://localhost:3000/api/v1/registrations

Login
curl -H 'Content-Type: application/json'   -H 'Accept: application/json' -X POST http://localhost:3000/api/v1/sessions/login   -d '{"user": {"email": "your@email.com", "password": "your_password"}}'

Logout/Destroy

curl -H 'Content-Type: application/json'   -H 'Accept: application/json' -X DELETE http://localhost:3000/api/v1/sessions/logout   -d '{"user": {"email": "your@email.com", "token": "05b99038665bf29dc62026f1958446ca"}}'
