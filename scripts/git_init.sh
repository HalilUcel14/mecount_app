echo 'cummit için başlık girin'
read name
git add .
git cummit -m "$name"
echo 'yayınlamak için branch girin'
read branch
git branch "$branch"
git push -u origin "$branch"