#!/bin/sh

ps -eo stat,pid,uid,pcpu,cmd,time | grep '^S '
