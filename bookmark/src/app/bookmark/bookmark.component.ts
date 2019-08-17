import { Component, OnInit } from "@angular/core";
// import { Bookmark } from '../bookmark';
import { Router } from "@angular/router";
import { ApiService } from "../api.service";
import { AngularTokenService } from "angular-token";

@Component({
  selector: "app-bookmark",
  templateUrl: "./bookmark.component.html",
  styleUrls: ["./bookmark.component.scss"]
})
export class BookmarkComponent implements OnInit {
  constructor(
    private tokenService: AngularTokenService,
    public apiService: ApiService,
    public router: Router // private tokenService: AngularTokenService
  ) {}

  output: any;
  signInData = {
    login: "bella@dog.com",
    password: "pass123"
  };

  ngOnInit() {
    // this.apiService.post("signin", "password");

    this.output = null;

    this.tokenService.signIn(this.signInData).subscribe(
      res => {
        this.output = res;
        // this.signInForm.resetForm();
      },
      error => {
        this.output = error;
        // this.signInForm.resetForm();
      }
    );

    console.log("bookmarkinit");

    // this.apiService.get("bookmarks").subscribe((data: any) => {
    //   console.log(data);
    // });
  }
}
