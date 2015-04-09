for file in *.yml; do
  f=${file%.*}
  node p.js $f > ../syntax/yats/$f.vim
done
