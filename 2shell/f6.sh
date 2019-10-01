#!/bin/bash

ls | wc | awk '{print $1}'
