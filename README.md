# jogltest

A container for testing jogamp ld.so inconsistency error with different JDKs

In debian 11 and ubuntu 22.04, the openjdk can not run  java apps that use jogamp / jogl.

Instead they fail with an error 'ld.so inconsistency detected'.

This container was for running against different jdk versions to see if other ones will work successfully.

It was found that the JDK 17 from 'Eclipse Adoptium' (previously known as AdoptOpenJDK) works fine.
