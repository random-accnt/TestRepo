package service_1

import (
	"fmt"
	"log"
	"net/http"
)

func pingHandler(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/ping" {
		http.NotFound(w, r)
		return
	}
	if r.Method != http.MethodGet {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}
	fmt.Fprintf(w, "Service 1 is running")
}

func main() {
	http.HandleFunc("/ping", pingHandler)
	port := "8081"
	log.Printf("Service 1 starting on port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
