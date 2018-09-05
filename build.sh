if [ ${TRAVIS_PULL_REQUEST} = 'false' ] && [[ $TRAVIS_BRANCH = 'master'  ||  ${TRAVIS_BRANCH} = 'develop' ]]; then
      echo 'Checking Quality Gates'
      mvn -B clean verify sonar:sonar \
      -Dsonar.host.url=${SONAR_URL} \
      -Dsonar.login=${SONAR_LOGIN} \
      -Dsonar.projectKey=${SONAR_PROJECT} \
      -Dsonar.organization=${SONAR_ORGANIZATION}
fi
elif [ ${TRAVIS_PULL_REQUEST} != 'false' ]; then
      echo 'Build and analyze pull request'
      mvn -B clean verify sonar:sonar \
      -Dsonar.host.url=${SONAR_URL} \
      -Dsonar.projectKey=${housseine_devops} \
      -Dsonar.organization=${housseine-github} \
      -Dsonar.login=${housseine@github} \
      -Dsonar.github.oauth=${4f9a0b8a092d50edb313eefb173bc5918e652f74} \
      -Dsonar.pullrequest.github.repository=${housseine/devops}  \
      -Dsonar.pullrequest.provider=GitHub  \
      -Dsonar.pullrequest.branch=${develop}  \
      -Dsonar.pullrequest.key=${TRAVIS_PULL_REQUEST};
fi