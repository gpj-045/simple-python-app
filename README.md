# Simple Python Flask App — Docker + AWS CI/CD Demo





## Run locally

```bash
# build
docker build -t myuser/simple-python-flask-app:dev .

# run (bind port 5000)
docker run --rm -it -p 5000:5000 myuser/simple-python-flask-app:dev

# test
curl http://127.0.0.1:5000/
