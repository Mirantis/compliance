default: serve

clean:
	rm -rf exports/ opencontrols/

serve: exports
	cd exports && gitbook --gitbook 2.6.7 serve

exports: opencontrols
	compliance-masonry docs gitbook FedRAMP-moderate

opencontrols:
	compliance-masonry get