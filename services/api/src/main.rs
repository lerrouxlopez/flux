#[macro_use]
extern crate rocket;

use rocket::serde::json::Json;

#[derive(serde::Serialize)]
struct Health {
    status: &'static str,
}

#[get("/health")]
fn health() -> Json<Health> {
    Json(Health { status: "ok" })
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![health])
}
