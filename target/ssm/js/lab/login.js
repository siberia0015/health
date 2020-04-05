var app = angular.module('myApp', []);
app.controller('loginController', function ($scope, $http) {

    $scope.login = function () {
        $http({
            method: "post",
            url: "/user/login",
            data:{username:$scope.username,password:$scope.password}
        }).success(function () {
            if (result.success) {
                //登录成功执行的代码
                console.log("success!");
                window.location.href = "https://www.example.com/"
            } else {
                console.log("error1");
                window.location = "https://www.taobao.com/"
            }
        }).error(function () {
            console.log("error2");
            window.location = "https://www.baidu.com/"
        })
    };
});
