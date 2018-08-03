cmake_minimum_required(VERSION 3.10.2)
project(kafka_consumer)
add_executable(kafka_consumer main.cpp)

find_package(Boost REQUIRED)
find_path(cppkafka_include "cppkafka/consumer.h")

target_link_libraries(kafka_consumer
  Boost::boost
  cppkafka
)
target_include_directories(kafka_consumer
  PRIVATE
    cppkafka_include
)

install(TARGETS kafka_consumer
  RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
)
