if [ ${TRAVIS_PULL_REQUEST} = 'false' ] && [[ $TRAVIS_BRANCH = 'master'  ||  ${TRAVIS_BRANCH} = 'develop' ]]; then
      echo 'Checking Quality Gates'
      mvn -B clean verify sonar:sonar \
      -Dsonar.host.url=${SONAR_URL} \
      -Dsonar.login=${SONAR_LOGIN} \
      -Dsonar.projectKey=${SONAR_PROJECT} \
      -Dsonar.organization=${SONAR_ORGANIZATION}

elif [ ${TRAVIS_PULL_REQUEST} != 'false' ]; then
      echo 'Build and analyze pull request'
      mvn -B clean verify sonar:sonar \
      -Dsonar.host.url=${SONAR_URL} \
      -Dsonar.projectKey=${housseine_devops} \
      -Dsonar.organization=${housseine-github} \
      -Dsonar.login=${SONAR_LOGIN} \
      -Dsonar.github.oauth=7308820e27aaae162b89234be65dbaf7feeba422 \
      -Dsonar.pullrequest.github.repository=${housseine/devops}  \
      -Dsonar.pullrequest.provider=GitHub  \
      -Dsonar.pullrequest.branch=${TRAVIS_BRANCH}  \
      -Dsonar.pullrequest.key=${TRAVIS_PULL_REQUEST};
fi
