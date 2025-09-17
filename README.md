# Simple Python Flask App — Docker + AWS CI/CD Demo





## Run locally

```bash
# build
docker build -t gpjtech045/simple-python-flask-app:latest .

# run (bind port 5000)
docker run --rm -it -p 5000:5000 gpjtech045/simple-python-flask-app:latest

# test
curl http://127.0.0.1:5000/

