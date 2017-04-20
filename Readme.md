# Quickstart

The idea of this repository is to quickly install a TYPO3 instance via composer.

To achieve that we have 3 files:

## composer.json

defines versions constraints for packages to be installed

## composer.lock

locks the defined version constraints to specific versions of the needed packages

## install.sh

is used to install TYPO3 finally.

currently `install.sh` defines some environment variables in the beginning of the script.
This it's planned, that you can pass your own like this:

```
DBUSER=root DBPASSWORD=23895798 install.sh
```

Having this will allow you to easily install TYPO3 fully automated.