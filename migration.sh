IFS='|'
while read -r gitlaburl bitbucketurl
do
	i=$((i+1))
 	repo_variable="text${i}"
	repo_name=${bitbucketurl##*/}
	git clone --bare $bitbucketurl
	cd $repo_name;
 	git remote add $repo_variable $gitlaburl
	git push --mirror $repo_variable
	cd ..
	rm -rf $repo_name;
done < ./input.txt
