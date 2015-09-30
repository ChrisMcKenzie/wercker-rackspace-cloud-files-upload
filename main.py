import sys
import pyrax

if len(sys.argv) < 7 :
  print 'There should be 7 arguments'
  sys.exit(1)

region = str(sys.argv[1])
username = str(sys.argv[2])
token = str(sys.argv[3])
path = str(sys.argv[4])
file_path = str(sys.argv[5])
container = str(sys.argv[6])

# Using direct method
pyrax.set_setting("identity_type", "rackspace")
pyrax.set_default_region(region)
pyrax.set_credentials(username, token)

contents = open(file_path)

container = pyrax.cloudfiles.get_container(container)
obj = container.store_object(path, contents)
print "Stored object:", obj
