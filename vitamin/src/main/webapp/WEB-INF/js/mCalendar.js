$.mCalendar = function(t, u, v, w) {
    if (!w) w = "-";
    var x = $(t);
    var y = new Date(parseInt(u.split(w)[0]), parseInt(u.split(w)[1]) - 1, 1);
    var A = new Date(parseInt(v.split(w)[0]), parseInt(v.split(w)[1]) - 1, 1);
    if (y > A) return;
    if (y.getMonth() != A.getMonth() || y.getFullYear() != A.getFullYear()) {
        var B = [];
        var C;
        C = (A.getFullYear() - y.getFullYear()) * 12;
        C -= y.getMonth() + 1;
        C += A.getMonth() + 1;
        for (var i = 0; i < C; i++) {
            var D = $(t + ":eq(0)").clone();
            B.push(D)
        }
        makeCal(t, y);
        var E = y.getFullYear();
        var F = y.getMonth() + 1;
        var G = y.getMonth();
        var H = x;
        B.forEach(function(a, i) {
            H.after(a);
            H = a;
            if (i != 0 && G >= F) {
                E++
            }
            makeCal(a, new Date(E, F++))
        })
    } else {
        makeCal(t, y)
    }
    
    function ifFn(o, i, f, p, j, k) {
    	if (u.split(w)[0] <= "20" + j && v.split(w)[0] >= "20" + j) {
            if (u.split(w)[0] == v.split(w)[0]) {
                if (u.split(w)[1] == k == v.split(w)[1]) {
                    if (u.split(w)[2] <= i && v.split(w)[2] >= i) {
                        f.addClass("select")
                    }
                } else if (u.split(w)[1] == k) {
                    if (u.split(w)[2] <= i) {
                        f.addClass("select")
                    }
                } else if (v.split(w)[1] == k) {
                    if (v.split(w)[2] >= i) {
                        f.addClass("select")
                    }
                } else if (u.split(w)[1] < k < v.split(w)[1]) {
                    f.addClass("select")
                }
            } else if (u.split(w)[0] != v.split(w)[0] && u.split(w)[0] == "20" + j && u.split(w)[1] <= k) {
                if (u.split(w)[1] == k) {
                    if (u.split(w)[2] <= i) {
                        f.addClass("select")
                    }
                } else if (u.split(w)[1] < k) {
                    f.addClass("select")
                }
            } else if (u.split(w)[0] < "20" + j) {
                if (v.split(w)[0] > "20" + j) {
                    f.addClass("select")
                } else if (v.split(w)[0] == "20" + j && v.split(w)[1] >= k) {
                    if (v.split(w)[1] == k && v.split(w)[2] >= i) {
                        f.addClass("select")
                    } else if (v.split(w)[1] > k) {
                        f.addClass("select")
                    }
                }
            }
        }
    }

    function makeCal(a, b, c) {
        a = $(a);
        b = new Date(b.getFullYear(), b.getMonth(), 1);
        if (c) b.setMonth(c + 1);
        var d = $("<div>").addClass("weekTitle");
        var e = ["일", "월", "화", "수", "목", "금", "토"];
        for (var i = 0; i < e.length; i++) {
            var f = $("<div>").append($("<div>").text(e[i])).addClass("day");
            if (i == 0) f.addClass("sun");
            else if (i == e.length) f.addClass("sat");
            f.appendTo(d)
        };
        var g = new Date(b.getFullYear(), b.getMonth() + 1, 0).getDate();
        var h = b.getDay();
        var j = (b.getFullYear()).toString().substring(2);
        var k = b.getMonth() + 1;
        if (k.toString().length == 1) k = "0" + k;
        var l = new Date(b.getFullYear(), b.getMonth(), 0);
        var m = l.getDate();
        var n = $("<div>").addClass("mCalendar").append($("<div>").addClass("title").append($("<div>").addClass("month").text((b.getMonth() + 1) + "월")).append($("<div>").addClass("year").text(b.getFullYear()))).append(d);
        a.append(n);
        n.append($("<div>").addClass("week"));
        for (var i = 0; i < h; i++) {
            n.find(".week:eq(0)").append($("<div>").addClass("day prev").append($("<div>").text((m + 1) - (h - i))))
        }
        for (var i = 1; i <= 7 - h; i++) {
            var o = i;
            if (o.toString().length == 1) o = "0" + o;
            var f = $("<div>").addClass("day").append($("<div>").text(i));
            var p = new Date();
            if (j == p.getYear() - 100 && k == p.getMonth() + 1 && i == p.getDate()) {
                f.addClass("now")
            }
            if (u.split(w)[0] == "20" + j && u.split(w)[1] == k && parseInt(u.split(w)[2]) == i) {
                f.addClass("start")
            } else if (v.split(w)[0] == "20" + j && v.split(w)[1] == k && parseInt(v.split(w)[2]) == i) {
                f.addClass("end")
            }
            
            ifFn(o, i, f, p, j, k);
            
            if (i == 7 - h) f.addClass("sat");
            else if (i == 1 && h == 0) f.addClass("sun");
            n.find(".week:eq(0)").append(f)
        }
        var q = 1;
        var r = n.find(".week:eq(0)");
        for (var i = 7 - h + 1; i <= g; i++) {
            var o = i;
            if (o.toString().length == 1) o = "0" + o;
            var s = r.find("> div").length;
            var f = $("<div>").addClass("day").append($("<div>").text(i));
            if (j == p.getYear() - 100 && k == p.getMonth() + 1 && i == p.getDate()) {
                f.addClass("now")
            }
            if (u.split(w)[0] == "20" + j && u.split(w)[1] == k && parseInt(u.split(w)[2]) == i) {
                f.addClass("start")
            } else if (v.split(w)[0] == "20" + j && v.split(w)[1] == k && parseInt(v.split(w)[2]) == i) {
                f.addClass("end")
            }

            ifFn(o, i, f, p, j, k);
            
            if (s % 7 == 0) {
                n.append($("<div>").addClass("week"));
                r = n.find(".week:eq(" + q++ + ")");
                f.addClass("sun")
            } else if (s % 6 == 0) f.addClass("sat");
            r.append(f);
            if (i == g) {
                s = f.parent().find("> div").length;
                for (var z = 0; z < 7 - s; z++) {
                    r.append($("<div>").addClass("day"))
                }
            }
        }
        if (q == 5) {
            n.append($("<div>").addClass("week"))
        }
    }
}