## HOMEWORK
```
$ mkdir .github && cd .github && mkdir workflows
$ touch action.yml
$ touch test.sh
```
# Action.yml
```
name: Lab
on: push
jobs:
    build-project:
        runs-on: ubuntu-latest
        steps:
            - name: Checkout
              uses: actions/checkout@v4
            
            - name: formater_lib
              run: |
                cd ${{ github.workspace }}/formatter_lib/
                rm -rf build
                mkdir build && cd build
                cmake ..
                cmake --build .

            - name: formater_ex_lib
              run: |
                cd ${{ github.workspace }}/formatter_ex_lib/
                rm -rf build
                mkdir build && cd build
                cmake ..
                cmake --build .

            - name: hello_world
              run: |
                cd ${{ github.workspace }}/hello_world_application/
                rm -rf build
                mkdir build && cd build
                cmake ..
                cmake --build .

            - name: solver_lib
              run: |
                cd ${{ github.workspace }}/solver_lib/
                rm -rf build
                mkdir build && cd build
                cmake ..
                cmake --build .

            - name: solver_application
              run: |
                cd ${{ github.workspace }}/solver_application/
                rm -rf build
                mkdir build && cd build
                cmake ..
                cmake --build .
```
# test.sh
```
root=./
cmake --build $root/formatter_lib
cmake --build $root/formatter_ex_lib 
cmake --build $root/hello_world_application 
cmake --build $root/solver_lib
cmake --build $root/solver_application

$root/hello_world_application/_build/main
echo -e '1\n\2\n3' | $root/solver_application/_build/main
```
