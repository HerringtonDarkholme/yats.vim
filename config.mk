NAME=yajs.vim
VERSION=1.4

bundle-deps:
	$(call fetch_github,ID,REPOSITORY,BRANCH,PATH,TARGET_PATH)
	$(call fetch_url,FILE_URL,TARGET_PATH)
