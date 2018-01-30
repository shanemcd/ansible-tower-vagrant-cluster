.PHONY: clean new

clean:
	vagrant destroy -f || :
	rm -rf .vagrant
	rm -rf provisioning/setup
	rm -rf provisioning/ansible-tower-setup-*
	find . -name "*.retry" -delete

new: clean
	vagrant up
