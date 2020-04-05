var app = angular.module("myApp", ["ngRoute"]); //使用config配置路由规则
app.config(["$routeProvider", function ($routeProvider) {
    $routeProvider.when("/addUser", {
        controller: "addUserCtrl", templateUrl: "addUser.html"
    }).when("/updatePwd/:name", {
        controller: "updatePwdCtrl", templateUrl: "updatePwd.html"
    }).otherwise({redirectTo: "/addUser"});
}]);
app.controller("myCtrl", function ($scope, $location) {
    $scope.users = [{"id": 1, "name": "张三", "pwd": "123", "age": 20, "sex": "男"},
        {"id": 2, "name": "李四", "pwd": "456", "age": 33, "sex": "女"},
        {"id": 3, "name": "王五", "pwd": "789", "age": 42, "sex": "男"}];
    //定义页面跳转方法
    $scope.goToUrl = function (path) {
        alert(path);
        $location.path(path);
    } //全部删除
    $scope.del = function () {
        if (confirm("确实删除吗？")) {
            $scope.users = [];
        }
    };
    $scope.ageTest = function (age, agesize) {
        if (agesize != "--请选择年龄段--") {
            var ages = agesize.split("-");
            var ageMin = ages[0];
            var ageMax = ages[1];
            if (age < ageMin || age > ageMax) {
                return false;
            } else {
                return true;
            }
        } else {
            return true;
        }
    } //批量删除
    $scope.deleteSel = function () {
        var userNames = [];
        for (index in $scope.users) {
            if ($scope.users[index].state == true) {
                userNames.push($scope.users[index].name);
            }
        }
        if (userNames.length > 0) {
            if (confirm("是否删除选中项？")) {
                for (i in userNames) {
                    var name = userNames[i];
                    for (i2 in $scope.users) {
                        if ($scope.users[i2].name == name) {
                            $scope.users.splice(i2, 1);
                        }
                    }
                }
            }
        } else {
            alert("请选择删除的项")
        }
    } //全选按钮
    $scope.gou = function () {
        for (var i = 0; i < $scope.users.length; i++) {
            if ($scope.checkAll == true) {
                $scope.users[i].state = true;
            } else {
                $scope.users[i].state = false;
            }
        }
    }
}); //定义添加用户控制器
app.controller("addUserCtrl", function ($scope) {
    $scope.name = "";
    $scope.pwd = "";
    $scope.pwd2 = "";
    $scope.age = "";
    $scope.sex = "";
    $scope.sub = function () {
        if ($scope.name == "") {
            alert("用户名不能为空");
        } else {
            if ($scope.age >= 10 && $scope.age <= 60) {
                var newUser = {
                    id: $scope.users.length + 1,
                    name: $scope.name,
                    pwd: $scope.pwd,
                    age: $scope.age,
                    sex: $scope.sex
                } //添加新用户.
                $scope.users.push(newUser);
            } else {
                alert("年龄在10到60之间");
            }
        }
    }
}); //定义修改用户控制器
app.controller("updatePwdCtrl", function ($scope, $routeParams) {
    $scope.name = $routeParams.name;
    $scope.oldPwd = "";
    $scope.pwd1 = "";
    $scope.pwd2 = "";
    $scope.updatePwd = function () {
        for (index in $scope.users) {
            if ($scope.users[index].name == $scope.name) {
                if ($scope.users[index].pwd == $scope.oldPwd) {
                    if ($scope.pwd1 == $scope.pwd2) {
                        $scope.users[index].pwd = $scope.pwd1;
                    } else {
                        alert("两次密码不一致");
                    }
                } else {
                    alert("旧密码错误");
                }
            }
        }
    }
});