docker build -t callsiq/sample-reactjs .
docker run -d -p 80:80 --name my-react-container my-react-app