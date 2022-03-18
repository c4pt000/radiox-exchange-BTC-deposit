#!/bin/bash

./gradlew build -x test shadowJar -Dorg.gradle.dependency.verification=lenient

