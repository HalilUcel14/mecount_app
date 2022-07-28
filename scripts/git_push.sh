echo 'Commit için başlık gir'.
read name
git add .
git commit -m "$name"
echo 'Yayınlamak İçin Branch Gir'.
read branches
git branch "$branches"
git push -u origin "$branches"