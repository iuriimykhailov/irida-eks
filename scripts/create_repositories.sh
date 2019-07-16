#!/bin/bash
aws ecr create-repository --repository-name dfornika/irida-db --region us-west-2
aws ecr create-repository --repository-name dfornika/irida --region us-west-2
