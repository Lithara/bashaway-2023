for i in {1..10}; do
  echo "Commit $i" >> out/commits.txt
  git commit -m "Commit $i" >> out/commits.txt
done
