#!/bin/bash
ssh-agent -s
exec ssh-agent bash
ssh-add ""
