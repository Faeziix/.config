git push $(git remote -v | awk 'FNR>1{ print $1}') HEAD
