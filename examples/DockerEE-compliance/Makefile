.PHONY: opencontrols exports

default: serve

clean:
	rm -rf exports/ opencontrols/

serve: exports
	docker run --rm -it -p 4000:4000 -v `PWD`/exports:/srv/gitbook fellah/gitbook:2.6.7

exports: opencontrols
	docker run --rm -v `PWD`:/opencontrol -w /opencontrol opencontrolorg/compliance-masonry docs gitbook FedRAMP-moderate

opencontrols: clean
	docker run --rm -v `PWD`:/opencontrol -w /opencontrol opencontrolorg/compliance-masonry get