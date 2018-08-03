#include <chrono>
#include <iostream>

#include <cppkafka/configuration.h>
#include <cppkafka/consumer.h>

using namespace std::chrono_literals;


int main() {
  cppkafka::Consumer consumer_(cppkafka::Configuration(
    {{"metadata.broker.list", "BROKER_LIST"},
     {"group.id", "GROUP_ID"},
     {"enable.auto.commit", false},
     {"client.id", "CLIENT_ID"},
     {"auto.offset.reset", "latest"},
     {"api.version.request", true}}));
  consumer_.subscribe({"TOPIC"});
  for (;;) {
    for (cppkafka::Message& msg: consumer_.poll_batch(1024, 0ms)) {
      if (!msg) {
        continue;
      }
      std::cout << "Got message ...";
    }
  }
}
