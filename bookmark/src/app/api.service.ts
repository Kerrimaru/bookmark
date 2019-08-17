import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: "root"
})
export class ApiService {
  constructor(public http: HttpClient) {}

  API_URL = "http://localhost:3000/";

  // read method
  public get(path) {
    const endpoint = this.API_URL + path;
    console.log(endpoint);
    return this.http.get(endpoint);
  }

  public signIn() {
    const path = this.API_URL + "users/sign_in";
    const params = { email: "bella@dog.com", password: "test123" };
    return this.http.post(path, params, { responseType: "text" });
  }

  // create method
  public post(path: string, body: any) {
    console.log("this isnt getting called, right?");
    const endpoint = "http://localhost:3000/users/sign_in";
    const params = { email: "bella@dog.com", password: "test123" };
    return this.http.post(endpoint, params);
    // const endpoint = this.API_URL + path;
    // return this.http.post(endpoint, body);
  }
  // delete method
  public delete(path: string) {
    const endpoint = this.API_URL + path;
    return this.http.delete(endpoint);
  }
  // update method
  public update(path: string, body: any) {
    const endpoint = this.API_URL + path;
    return this.http.put(endpoint, body);
  }
}
