use rdkafka::config::ClientConfig;
use rdkafka::consumer::BaseConsumer;

fn main() {
    println!("flux workers placeholder");

    let _consumer: BaseConsumer = ClientConfig::new()
        .set("bootstrap.servers", "localhost:9092")
        .set("group.id", "flux-workers")
        .create()
        .expect("consumer");
}
