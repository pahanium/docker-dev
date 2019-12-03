## Adding global .gitignore file ##
```
echo "/docker-dev/" > ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

## Init ##
```
cd project
git clone https://github.com/pahanium/docker-dev.git
```

## Start ##
```
cd docker-dev
docker-compose up
```
