package main

import (
	"flag"
	"fmt"
	"io/ioutil"

	"github.com/ncw/swift"
)

const (
	AUTH_URL = "https://identity.api.rackspacecloud.com/v2.0"
)

var (
	user      = flag.String("user", "", "username for rackspace")
	key       = flag.String("key", "", "apikey for rackspace")
	container = flag.String("container", "", "container to put file in.")
	file      = flag.String("file", "", "path to file that will be uploaded")
	path      = flag.String("path", "", "path to upload given file to")
	region    = flag.String("region", "", "region that we are accessing")
)

func init() {
	flag.Parse()
}

func main() {
	// Create a v1 auth connection
	var c = swift.Connection{
		// This should be your username
		UserName: *user,
		// This should be your api key
		ApiKey: *key,
		// This should be a v1 auth url, eg
		//  Rackspace US        https://auth.api.rackspacecloud.com/v1.0
		//  Rackspace UK        https://lon.auth.api.rackspacecloud.com/v1.0
		//  Memset Memstore UK  https://auth.storage.memset.com/v1.0
		AuthUrl: AUTH_URL,
		// Region to use - default is use first region if unset
		Region: *region,
		// Name of the tenant - this is likely your username
		// Tenant: "thecontrolgroup",
	}
	// Authenticate
	err := c.Authenticate()
	if err != nil {
		fmt.Printf("Unable to authenticate: %s", err)
		return
	}

	// Read File
	contents, err := ioutil.ReadFile(*file)
	if err != nil {
		fmt.Printf("Unable to read file: %s", err)
		return
	}

	// Write Bytes
	err = c.ObjectPutBytes(*container, *path, contents, "")
	if err != nil {
		fmt.Printf("Unable to upload data: %s", err)
		return
	}

	fmt.Println("File sucessfully uploaded...")
}
