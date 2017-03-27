#!/bin/bash

ENV_VARS=($(printenv))
SM_ENV=""

for ENV_VAR in "${ENV_VARS[@]}"; do
	ENV_VAR_SPLIT=($(echo $ENV_VAR | tr "=" "\n"))

	ENV_NAME="${ENV_VAR_SPLIT[0]}"
	ENV_NAME="$(echo $ENV_NAME | tr '[:upper:]' '[:lower:]') "
	ENV_NAME="${ENV_NAME//_/.}"
	ENV_NAME="$(echo -e "${ENV_NAME}" | tr -d '[:space:]')"
	ENV_VAL="${ENV_VAR_SPLIT[1]}"

	case "$ENV_NAME" in
	        "action")
	            SM_ENV="$SM_ENV --$ENV_NAME=$ENV_VAL"
	            ;;
	        "r2rml.file")
	        	SM_ENV="$SM_ENV --$ENV_NAME=$ENV_VAL"
	    		;;
	        *)
				if [[ "$ENV_NAME" == "ds."* ]] || [[ "$ENV_NAME" == "dm."* ]]; then
					SM_ENV="$SM_ENV --${ENV_NAME}=${ENV_VAL}"

				fi
				;;
    esac	

done


#echo "Starting sparqlmap with variables is: $SM_ENV"


/opt/sparqlmap/bin/sparqlmap $SM_ENV