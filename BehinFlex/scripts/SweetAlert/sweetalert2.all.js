! function (n, t) {
    "object" == typeof exports && "undefined" != typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define(t) : n.Sweetalert2 = t()
}(this, function () {
    "use strict";
    var n = {
        title: "",
        titleText: "",
        text: "",
        html: "",
        type: null,
        toast: !1,
        customClass: "",
        target: "body",
        backdrop: !0,
        animation: !0,
        allowOutsideClick: !0,
        allowEscapeKey: !0,
        allowEnterKey: !0,
        showConfirmButton: !0,
        showCancelButton: !1,
        preConfirm: null,
        confirmButtonText: "OK",
        confirmButtonAriaLabel: "",
        confirmButtonColor: "#3085d6",
        confirmButtonClass: null,
        cancelButtonText: "Cancel",
        cancelButtonAriaLabel: "",
        cancelButtonColor: "#aaa",
        cancelButtonClass: null,
        buttonsStyling: !0,
        reverseButtons: !1,
        focusConfirm: !0,
        focusCancel: !1,
        showCloseButton: !1,
        closeButtonAriaLabel: "Close this dialog",
        showLoaderOnConfirm: !1,
        imageUrl: null,
        imageWidth: null,
        imageHeight: null,
        imageAlt: "",
        imageClass: null,
        timer: null,
        width: 500,
        padding: 20,
        background: "#fff",
        input: null,
        inputPlaceholder: "",
        inputValue: "",
        inputOptions: {},
        inputAutoTrim: !0,
        inputClass: null,
        inputAttributes: {},
        inputValidator: null,
        grow: !1,
        position: "center",
        progressSteps: [],
        currentProgressStep: null,
        progressStepsDistance: "40px",
        onBeforeOpen: null,
        onOpen: null,
        onClose: null,
        useRejections: !1,
        expectRejections: !1
    },
        t = ["useRejections", "expectRejections"],
        e = function (n) {
            var t = {};
            for (var e in n) t[n[e]] = "swal2-" + n[e];
            return t
        },
        o = e(["container", "shown", "iosfix", "popup", "modal", "no-backdrop", "toast", "toast-shown", "overlay", "fade", "show", "hide", "noanimation", "close", "title", "content", "contentwrapper", "buttonswrapper", "confirm", "cancel", "icon", "image", "input", "has-input", "file", "range", "select", "radio", "checkbox", "textarea", "inputerror", "validationerror", "progresssteps", "activeprogressstep", "progresscircle", "progressline", "loading", "styled", "top", "top-left", "top-right", "center", "center-left", "center-right", "bottom", "bottom-left", "bottom-right", "grow-row", "grow-column", "grow-fullscreen"]),
        a = e(["success", "warning", "info", "question", "error"]),
        s = function (n, t) {
            (n = String(n).replace(/[^0-9a-f]/gi, "")).length < 6 && (n = n[0] + n[0] + n[1] + n[1] + n[2] + n[2]), t = t || 0;
            for (var e = "#", o = 0; o < 3; o++) {
                var a = parseInt(n.substr(2 * o, 2), 16);
                e += ("00" + (a = Math.round(Math.min(Math.max(0, a + a * t), 255)).toString(16))).substr(a.length)
            }
            return e
        },
        r = function (n) {
            console.warn("SweetAlert2: " + n)
        },
        i = function (n) {
            console.error("SweetAlert2: " + n)
        },
        l = [],
        c = function (n) {
            -1 === l.indexOf(n) && (l.push(n), r(n))
        },
        p = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (n) {
            return typeof n
        } : function (n) {
            return n && "function" == typeof Symbol && n.constructor === Symbol && n !== Symbol.prototype ? "symbol" : typeof n
        },
        u = Object.assign || function (n) {
            for (var t = 1; t < arguments.length; t++) {
                var e = arguments[t];
                for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (n[o] = e[o])
            }
            return n
        },
        d = u({}, n),
        w = [],
        f = void 0,
        m = void 0;
    "undefined" == typeof Promise && i("This package requires a Promise library, please include a shim to enable it in this browser (See: https://github.com/limonte/sweetalert2/wiki/Migration-from-SweetAlert-to-SweetAlert2#1-ie-support)");
    var b = function (n) {
        for (var t in n) k.isValidParameter(t) || r('Unknown parameter "' + t + '"'), k.isDeprecatedParameter(t) && c('The parameter "' + t + '" is deprecated and will be removed in the next major release.')
    },
        g = function (t) {
            ("string" == typeof t.target && !document.querySelector(t.target) || "string" != typeof t.target && !t.target.appendChild) && (r('Target parameter is not valid, defaulting to "body"'), t.target = "body");
            var e = void 0,
                s = B(),
                l = "string" == typeof t.target ? document.querySelector(t.target) : t.target;
            e = s && l && s.parentNode !== l.parentNode ? C(t) : s || C(t);
            var c = t.width === n.width && t.toast ? "auto" : t.width;
            e.style.width = "number" == typeof c ? c + "px" : c;
            var u = t.padding === n.padding && t.toast ? "inherit" : t.padding;
            e.style.padding = "number" == typeof u ? u + "px" : u, e.style.background = t.background;
            for (var d = e.querySelectorAll("[class^=swal2-success-circular-line], .swal2-success-fix"), w = 0; w < d.length; w++) d[w].style.background = t.background;
            var f = A(),
                m = L(),
                b = T(),
                g = N(),
                x = O(),
                h = V(),
                y = Y();
            if (t.titleText ? m.innerText = t.titleText : m.innerHTML = t.title.split("\n").join("<br />"), t.backdrop || X(document.body, o["no-backdrop"]), t.text || t.html) {
                if ("object" === p(t.html))
                    if (b.innerHTML = "", 0 in t.html)
                        for (var v = 0; v in t.html; v++) b.appendChild(t.html[v].cloneNode(!0));
                    else b.appendChild(t.html.cloneNode(!0));
                else t.html ? b.innerHTML = t.html : t.text && (b.textContent = t.text);
                U(b)
            } else W(b);
            if (t.position in o && X(f, o[t.position]), t.grow && "string" == typeof t.grow) {
                var S = "grow-" + t.grow;
                S in o && X(f, o[S])
            }
            t.showCloseButton ? (y.setAttribute("aria-label", t.closeButtonAriaLabel), U(y)) : W(y), e.className = o.popup, t.toast ? (X(document.body, o["toast-shown"]), X(e, o.toast)) : X(e, o.modal), t.customClass && X(e, t.customClass);
            var E = q(),
                j = parseInt(null === t.currentProgressStep ? k.getQueueStep() : t.currentProgressStep, 10);
            t.progressSteps.length ? (U(E), K(E), j >= t.progressSteps.length && r("Invalid currentProgressStep parameter, it should be less than progressSteps.length (currentProgressStep like JS arrays starts from 0)"), t.progressSteps.forEach(function (n, e) {
                var a = document.createElement("li");
                if (X(a, o.progresscircle), a.innerHTML = n, e === j && X(a, o.activeprogressstep), E.appendChild(a), e !== t.progressSteps.length - 1) {
                    var s = document.createElement("li");
                    X(s, o.progressline), s.style.width = t.progressStepsDistance, E.appendChild(s)
                }
            })) : W(E);
            for (var H = P(), Z = 0; Z < H.length; Z++) W(H[Z]);
            if (t.type) {
                var M = !1;
                for (var R in a)
                    if (t.type === R) {
                        M = !0;
                        break
                    } if (!M) return i("Unknown alert type: " + t.type), !1;
                var I = e.querySelector("." + o.icon + "." + a[t.type]);
                if (U(I), t.animation) switch (t.type) {
                    case "success":
                        X(I, "swal2-animate-success-icon"), X(I.querySelector(".swal2-success-line-tip"), "swal2-animate-success-line-tip"), X(I.querySelector(".swal2-success-line-long"), "swal2-animate-success-line-long");
                        break;
                    case "error":
                        X(I, "swal2-animate-error-icon"), X(I.querySelector(".swal2-x-mark"), "swal2-animate-x-mark")
                }
            }
            var $ = z();
            t.imageUrl ? ($.setAttribute("src", t.imageUrl), $.setAttribute("alt", t.imageAlt), U($), t.imageWidth ? $.setAttribute("width", t.imageWidth) : $.removeAttribute("width"), t.imageHeight ? $.setAttribute("height", t.imageHeight) : $.removeAttribute("height"), $.className = o.image, t.imageClass && X($, t.imageClass)) : W($), t.showCancelButton ? h.style.display = "inline-block" : W(h), t.showConfirmButton ? Q(x, "display") : W(x), t.showConfirmButton || t.showCancelButton ? U(g) : W(g), x.innerHTML = t.confirmButtonText, h.innerHTML = t.cancelButtonText, x.setAttribute("aria-label", t.confirmButtonAriaLabel), h.setAttribute("aria-label", t.cancelButtonAriaLabel), t.buttonsStyling && (x.style.backgroundColor = t.confirmButtonColor, h.style.backgroundColor = t.cancelButtonColor), x.className = o.confirm, X(x, t.confirmButtonClass), h.className = o.cancel, X(h, t.cancelButtonClass), t.buttonsStyling ? (X(x, o.styled), X(h, o.styled)) : (D(x, o.styled), D(h, o.styled), x.style.backgroundColor = x.style.borderLeftColor = x.style.borderRightColor = "", h.style.backgroundColor = h.style.borderLeftColor = h.style.borderRightColor = ""), !0 === t.animation ? D(e, o.noanimation) : X(e, o.noanimation), t.showLoaderOnConfirm && !t.preConfirm && r("showLoaderOnConfirm is set to true, but preConfirm is not defined.\nshowLoaderOnConfirm should be used together with preConfirm, see usage example:\nhttps://limonte.github.io/sweetalert2/#ajax-request")
        },
        x = function () {
            null === y.previousBodyPadding && document.body.scrollHeight > window.innerHeight && (y.previousBodyPadding = document.body.style.paddingRight, document.body.style.paddingRight = G() + "px")
        },
        h = function () {
            if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream && !R(document.body, o.iosfix)) {
                var n = document.body.scrollTop;
                document.body.style.top = -1 * n + "px", X(document.body, o.iosfix)
            }
        },
        k = function n() {
            for (var t = arguments.length, e = Array(t), a = 0; a < t; a++) e[a] = arguments[a];
            if ("undefined" != typeof window) {
                if (void 0 === e[0]) return i("SweetAlert2 expects at least 1 attribute!"), !1;
                var r = u({}, d);
                switch (p(e[0])) {
                    case "string":
                        r.title = e[0], r.html = e[1], r.type = e[2];
                        break;
                    case "object":
                        if (b(e[0]), u(r, e[0]), r.extraParams = e[0].extraParams, "email" === r.input && null === r.inputValidator) {
                            var l = function (n) {
                                return new Promise(function (t, e) {
                                    /^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9-]{2,24}$/.test(n) ? t() : e("Invalid email address")
                                })
                            };
                            r.inputValidator = r.expectRejections ? l : n.adaptInputValidator(l)
                        }
                        if ("url" === r.input && null === r.inputValidator) {
                            var c = function (n) {
                                return new Promise(function (t, e) {
                                    /^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_+.~#?&//=]*)$/.test(n) ? t() : e("Invalid URL")
                                })
                            };
                            r.inputValidator = r.expectRejections ? c : n.adaptInputValidator(c)
                        }
                        break;
                    default:
                        return i('Unexpected type of argument! Expected "string" or "object", got ' + p(e[0])), !1
                }
                g(r);
                var w = A(),
                    k = B();
                return new Promise(function (t, e) {
                    var a = function (e) {
                        n.closePopup(r.onClose), t(r.useRejections ? e : {
                            value: e
                        })
                    },
                        l = function (o) {
                            n.closePopup(r.onClose), r.useRejections ? e(o) : t({
                                dismiss: o
                            })
                        },
                        c = function (t) {
                            n.closePopup(r.onClose), e(t)
                        };
                    r.timer && (k.timeout = setTimeout(function () {
                        return l("timer")
                    }, r.timer));
                    var u = function (n) {
                        if (!(n = n || r.input)) return null;
                        switch (n) {
                            case "select":
                            case "textarea":
                            case "file":
                                return $(k, o[n]);
                            case "checkbox":
                                return k.querySelector("." + o.checkbox + " input");
                            case "radio":
                                return k.querySelector("." + o.radio + " input:checked") || k.querySelector("." + o.radio + " input:first-child");
                            case "range":
                                return k.querySelector("." + o.range + " input");
                            default:
                                return $(k, o.input)
                        }
                    };
                    r.input && setTimeout(function () {
                        var n = u();
                        n && I(n)
                    }, 0);
                    for (var d = function (t) {
                        if (r.showLoaderOnConfirm && n.showLoading(), r.preConfirm) {
                            n.resetValidationError();
                            var e = Promise.resolve().then(function () {
                                return r.preConfirm(t, r.extraParams)
                            });
                            r.expectRejections ? e.then(function (n) {
                                return a(n || t)
                            }, function (t) {
                                n.hideLoading(), t && n.showValidationError(t)
                            }) : e.then(function (e) {
                                _(j()) ? n.hideLoading() : a(e || t)
                            }, function (n) {
                                return c(n)
                            })
                        } else a(t)
                    }, b = function (t) {
                        var e = t || window.event,
                            o = e.target || e.srcElement,
                            a = O(),
                            i = V(),
                            p = a && (a === o || a.contains(o)),
                            w = i && (i === o || i.contains(o));
                        switch (e.type) {
                            case "mouseover":
                            case "mouseup":
                                r.buttonsStyling && (p ? a.style.backgroundColor = s(r.confirmButtonColor, -.1) : w && (i.style.backgroundColor = s(r.cancelButtonColor, -.1)));
                                break;
                            case "mouseout":
                                r.buttonsStyling && (p ? a.style.backgroundColor = r.confirmButtonColor : w && (i.style.backgroundColor = r.cancelButtonColor));
                                break;
                            case "mousedown":
                                r.buttonsStyling && (p ? a.style.backgroundColor = s(r.confirmButtonColor, -.2) : w && (i.style.backgroundColor = s(r.cancelButtonColor, -.2)));
                                break;
                            case "click":
                                if (p && n.isVisible())
                                    if (n.disableButtons(), r.input) {
                                        var f = function () {
                                            var n = u();
                                            if (!n) return null;
                                            switch (r.input) {
                                                case "checkbox":
                                                    return n.checked ? 1 : 0;
                                                case "radio":
                                                    return n.checked ? n.value : null;
                                                case "file":
                                                    return n.files.length ? n.files[0] : null;
                                                default:
                                                    return r.inputAutoTrim ? n.value.trim() : n.value
                                            }
                                        }();
                                        if (r.inputValidator) {
                                            n.disableInput();
                                            var m = Promise.resolve().then(function () {
                                                return r.inputValidator(f, r.extraParams)
                                            });
                                            r.expectRejections ? m.then(function () {
                                                n.enableButtons(), n.enableInput(), d(f)
                                            }, function (t) {
                                                n.enableButtons(), n.enableInput(), t && n.showValidationError(t)
                                            }) : m.then(function (t) {
                                                n.enableButtons(), n.enableInput(), t ? n.showValidationError(t) : d(f)
                                            }, function (n) {
                                                return c(n)
                                            })
                                        } else d(f)
                                    } else d(!0);
                                else w && n.isVisible() && (n.disableButtons(), l("cancel"))
                        }
                    }, v = k.querySelectorAll("button"), C = 0; C < v.length; C++) v[C].onclick = b, v[C].onmouseover = b, v[C].onmouseout = b, v[C].onmousedown = b;
                    Y().onclick = function () {
                        l("close")
                    }, r.toast ? k.onclick = function (t) {
                        t.target !== k || r.showConfirmButton || r.showCancelButton || r.allowOutsideClick && (n.closePopup(r.onClose), l("overlay"))
                    } : w.onclick = function (n) {
                        n.target === w && r.allowOutsideClick && l("overlay")
                    };
                    var S = N(),
                        P = O(),
                        E = V();
                    r.reverseButtons ? P.parentNode.insertBefore(E, P) : P.parentNode.insertBefore(P, E);
                    var M = function (n, t) {
                        for (var e = H(r.focusCancel), o = 0; o < e.length; o++) {
                            (n += t) === e.length ? n = 0 : -1 === n && (n = e.length - 1);
                            var a = e[n];
                            if (_(a)) return a.focus()
                        }
                    };
                    r.toast && m && (window.onkeydown = f, m = !1), r.toast || m || (f = window.onkeydown, m = !0, window.onkeydown = function (t) {
                        var e = t || window.event;
                        if ("Enter" !== e.key || e.isComposing)
                            if ("Tab" === e.key) {
                                for (var o = e.target || e.srcElement, a = H(r.focusCancel), s = -1, i = 0; i < a.length; i++)
                                    if (o === a[i]) {
                                        s = i;
                                        break
                                    } e.shiftKey ? M(s, -1) : M(s, 1), e.stopPropagation(), e.preventDefault()
                            } else -1 !== ["ArrowLeft", "ArrowRight", "ArrowUp", "ArrowDown", "Left", "Right", "Up", "Down"].indexOf(e.key) ? document.activeElement === P && _(E) ? E.focus() : document.activeElement === E && _(P) && P.focus() : "Escape" !== e.key && "Esc" !== e.key || !0 !== r.allowEscapeKey || l("esc");
                        else if (e.target === u()) {
                            if ("textarea" === e.target.tagName.toLowerCase()) return;
                            n.clickConfirm(), e.preventDefault()
                        }
                    }), r.buttonsStyling && (P.style.borderLeftColor = r.confirmButtonColor, P.style.borderRightColor = r.confirmButtonColor), n.hideLoading = n.disableLoading = function () {
                        r.showConfirmButton || (W(P), r.showCancelButton || W(N())), D(S, o.loading), D(k, o.loading), k.removeAttribute("aria-busy"), P.disabled = !1, E.disabled = !1
                    }, n.getTitle = function () {
                        return L()
                    }, n.getContent = function () {
                        return T()
                    }, n.getInput = function () {
                        return u()
                    }, n.getImage = function () {
                        return z()
                    }, n.getButtonsWrapper = function () {
                        return N()
                    }, n.getConfirmButton = function () {
                        return O()
                    }, n.getCancelButton = function () {
                        return V()
                    }, n.enableButtons = function () {
                        P.disabled = !1, E.disabled = !1
                    }, n.disableButtons = function () {
                        P.disabled = !0, E.disabled = !0
                    }, n.enableConfirmButton = function () {
                        P.disabled = !1
                    }, n.disableConfirmButton = function () {
                        P.disabled = !0
                    }, n.enableInput = function () {
                        var n = u();
                        if (!n) return !1;
                        if ("radio" === n.type)
                            for (var t = n.parentNode.parentNode.querySelectorAll("input"), e = 0; e < t.length; e++) t[e].disabled = !1;
                        else n.disabled = !1
                    }, n.disableInput = function () {
                        var n = u();
                        if (!n) return !1;
                        if (n && "radio" === n.type)
                            for (var t = n.parentNode.parentNode.querySelectorAll("input"), e = 0; e < t.length; e++) t[e].disabled = !0;
                        else n.disabled = !0
                    }, n.showValidationError = function (n) {
                        var t = j();
                        t.innerHTML = n, U(t);
                        var e = u();
                        e && (e.setAttribute("aria-invalid", !0), e.setAttribute("aria-describedBy", o.validationerror), I(e), X(e, o.inputerror))
                    }, n.resetValidationError = function () {
                        var n = j();
                        W(n);
                        var t = u();
                        t && (t.removeAttribute("aria-invalid"), t.removeAttribute("aria-describedBy"), D(t, o.inputerror))
                    }, n.getProgressSteps = function () {
                        return r.progressSteps
                    }, n.setProgressSteps = function (n) {
                        r.progressSteps = n, g(r)
                    }, n.showProgressSteps = function () {
                        U(q())
                    }, n.hideProgressSteps = function () {
                        W(q())
                    }, n.enableButtons(), n.hideLoading(), n.resetValidationError(), r.input && X(document.body, o["has-input"]);
                    for (var K = ["input", "file", "range", "select", "radio", "checkbox", "textarea"], Q = void 0, F = 0; F < K.length; F++) {
                        var G = o[K[F]],
                            nn = $(k, G);
                        if (Q = u(K[F])) {
                            for (var tn in Q.attributes)
                                if (Q.attributes.hasOwnProperty(tn)) {
                                    var en = Q.attributes[tn].name;
                                    "type" !== en && "value" !== en && Q.removeAttribute(en)
                                } for (var on in r.inputAttributes) Q.setAttribute(on, r.inputAttributes[on])
                        }
                        nn.className = G, r.inputClass && X(nn, r.inputClass), W(nn)
                    }
                    var an = void 0;
                    switch (r.input) {
                        case "text":
                        case "email":
                        case "password":
                        case "number":
                        case "tel":
                        case "url":
                            (Q = $(k, o.input)).value = r.inputValue, Q.placeholder = r.inputPlaceholder, Q.type = r.input, U(Q);
                            break;
                        case "file":
                            (Q = $(k, o.file)).placeholder = r.inputPlaceholder, Q.type = r.input, U(Q);
                            break;
                        case "range":
                            var sn = $(k, o.range),
                                rn = sn.querySelector("input"),
                                ln = sn.querySelector("output");
                            rn.value = r.inputValue, rn.type = r.input, ln.value = r.inputValue, U(sn);
                            break;
                        case "select":
                            var cn = $(k, o.select);
                            if (cn.innerHTML = "", r.inputPlaceholder) {
                                var pn = document.createElement("option");
                                pn.innerHTML = r.inputPlaceholder, pn.value = "", pn.disabled = !0, pn.selected = !0, cn.appendChild(pn)
                            }
                            an = function (n) {
                                for (var t in n) {
                                    var e = document.createElement("option");
                                    e.value = t, e.innerHTML = n[t], r.inputValue.toString() === t && (e.selected = !0), cn.appendChild(e)
                                }
                                U(cn), cn.focus()
                            };
                            break;
                        case "radio":
                            var un = $(k, o.radio);
                            un.innerHTML = "", an = function (n) {
                                for (var t in n) {
                                    var e = document.createElement("input"),
                                        a = document.createElement("label"),
                                        s = document.createElement("span");
                                    e.type = "radio", e.name = o.radio, e.value = t, r.inputValue.toString() === t && (e.checked = !0), s.innerHTML = n[t], a.appendChild(e), a.appendChild(s), a.for = e.id, un.appendChild(a)
                                }
                                U(un);
                                var i = un.querySelectorAll("input");
                                i.length && i[0].focus()
                            };
                            break;
                        case "checkbox":
                            var dn = $(k, o.checkbox),
                                wn = u("checkbox");
                            wn.type = "checkbox", wn.value = 1, wn.id = o.checkbox, wn.checked = Boolean(r.inputValue);
                            var fn = dn.getElementsByTagName("span");
                            fn.length && dn.removeChild(fn[0]), (fn = document.createElement("span")).innerHTML = r.inputPlaceholder, dn.appendChild(fn), U(dn);
                            break;
                        case "textarea":
                            var mn = $(k, o.textarea);
                            mn.value = r.inputValue, mn.placeholder = r.inputPlaceholder, U(mn);
                            break;
                        case null:
                            break;
                        default:
                            i('Unexpected type of input! Expected "text", "email", "password", "number", "tel", "select", "radio", "checkbox", "textarea", "file" or "url", got "' + r.input + '"')
                    }
                    "select" !== r.input && "radio" !== r.input || (r.inputOptions instanceof Promise ? (n.showLoading(), r.inputOptions.then(function (t) {
                        n.hideLoading(), an(t)
                    })) : "object" === p(r.inputOptions) ? an(r.inputOptions) : i("Unexpected type of inputOptions! Expected object or Promise, got " + p(r.inputOptions))),
                        function (n, t, e) {
                            var a = A(),
                                s = B();
                            null !== t && "function" == typeof t && t(s), n ? (X(s, o.show), X(a, o.fade), D(s, o.hide)) : D(s, o.fade), U(s), a.style.overflowY = "hidden", J && !R(s, o.noanimation) ? s.addEventListener(J, function n() {
                                s.removeEventListener(J, n), a.style.overflowY = "auto"
                            }) : a.style.overflowY = "auto", X(document.documentElement, o.shown), X(document.body, o.shown), X(a, o.shown), Z() && (x(), h()), y.previousActiveElement = document.activeElement, null !== e && "function" == typeof e && setTimeout(function () {
                                e(s)
                            })
                        }(r.animation, r.onBeforeOpen, r.onOpen), r.toast || (r.allowEnterKey ? r.focusCancel && _(E) ? E.focus() : r.focusConfirm && _(P) ? P.focus() : M(-1, 1) : document.activeElement && document.activeElement.blur()), A().scrollTop = 0
                })
            }
        };
    k.isVisible = function () {
        return !!B()
    }, k.queue = function (n) {
        w = n;
        var t = function () {
            w = [], document.body.removeAttribute("data-swal2-queue-step")
        },
            e = [];
        return new Promise(function (n, o) {
            ! function o(a, s) {
                a < w.length ? (document.body.setAttribute("data-swal2-queue-step", a), k(w[a]).then(function (r) {
                    void 0 !== r.value ? (e.push(r.value), o(a + 1, s)) : (t(), n({
                        dismiss: r.dismiss
                    }))
                })) : (t(), n({
                    value: e
                }))
            }(0)
        })
    }, k.getQueueStep = function () {
        return document.body.getAttribute("data-swal2-queue-step")
    }, k.insertQueueStep = function (n, t) {
        return t && t < w.length ? w.splice(t, 0, n) : w.push(n)
    }, k.deleteQueueStep = function (n) {
        void 0 !== w[n] && w.splice(n, 1)
    }, k.close = k.closePopup = k.closeModal = k.closeToast = function (n) {
        var t = A(),
            e = B();
        if (e) {
            D(e, o.show), X(e, o.hide), clearTimeout(e.timeout), M() || (F(), window.onkeydown = f, m = !1);
            var a = function () {
                t.parentNode && t.parentNode.removeChild(t), D(document.documentElement, o.shown), D(document.body, o.shown), D(document.body, o["no-backdrop"]), D(document.body, o["has-input"]), D(document.body, o["toast-shown"]), Z() && (null !== y.previousBodyPadding && (document.body.style.paddingRight = y.previousBodyPadding, y.previousBodyPadding = null), function () {
                    if (R(document.body, o.iosfix)) {
                        var n = parseInt(document.body.style.top, 10);
                        D(document.body, o.iosfix), document.body.style.top = "", document.body.scrollTop = -1 * n
                    }
                }())
            };
            J && !R(e, o.noanimation) ? e.addEventListener(J, function n() {
                e.removeEventListener(J, n), R(e, o.hide) && a()
            }) : a(), null !== n && "function" == typeof n && setTimeout(function () {
                n(e)
            })
        }
    }, k.clickConfirm = function () {
        return O().click()
    }, k.clickCancel = function () {
        return V().click()
    }, k.showLoading = k.enableLoading = function () {
        var n = B();
        n || k(""), n = B();
        var t = N(),
            e = O(),
            a = V();
        U(t), U(e, "inline-block"), X(t, o.loading), X(n, o.loading), e.disabled = !0, a.disabled = !0, n.setAttribute("aria-busy", !0), n.focus()
    }, k.isValidParameter = function (t) {
        return n.hasOwnProperty(t) || "extraParams" === t
    }, k.isDeprecatedParameter = function (n) {
        return -1 !== t.indexOf(n)
    }, k.setDefaults = function (n) {
        if (!n || "object" !== (void 0 === n ? "undefined" : p(n))) return i("the argument for setDefaults() is required and has to be a object");
        b(n);
        for (var t in n) k.isValidParameter(t) && (d[t] = n[t])
    }, k.resetDefaults = function () {
        d = u({}, n)
    }, k.adaptInputValidator = function (n) {
        return function (t, e) {
            return n.call(this, t, e).then(function () { }, function (n) {
                return n
            })
        }
    }, k.noop = function () { }, k.version = "7.1.0", k.default = k, "object" === p(window._swalDefaults) && k.setDefaults(window._swalDefaults);
    var y = {
        previousActiveElement: null,
        previousBodyPadding: null
    },
        v = function () {
            return "undefined" == typeof window || "undefined" == typeof document
        },
        C = function (n) {
            var t = A();
            t && (t.parentNode.removeChild(t), D(document.body, o["no-backdrop"]), D(document.body, o["has-input"]), D(document.body, o["toast-shown"])); {
                if (!v()) {
                    var e = document.createElement("div");
                    e.className = o.container, e.innerHTML = S;
                    ("string" == typeof n.target ? document.querySelector(n.target) : n.target).appendChild(e);
                    var a = B(),
                        s = $(a, o.input),
                        r = $(a, o.file),
                        l = a.querySelector("." + o.range + " input"),
                        c = a.querySelector("." + o.range + " output"),
                        p = $(a, o.select),
                        u = a.querySelector("." + o.checkbox + " input"),
                        d = $(a, o.textarea);
                    a.setAttribute("aria-live", n.toast ? "polite" : "assertive");
                    var w = function () {
                        k.isVisible() && k.resetValidationError()
                    };
                    return s.oninput = w, r.onchange = w, p.onchange = w, u.onchange = w, d.oninput = w, l.oninput = function () {
                        w(), c.value = l.value
                    }, l.onchange = function () {
                        w(), l.previousSibling.value = l.value
                    }, a
                }
                i("SweetAlert2 requires document to initialize")
            }
        },
        S = ('\n <div role="dialog" aria-modal="true" aria-labelledby="' + o.title + '" aria-describedby="' + o.content + '" class="' + o.popup + '" tabindex="-1">\n   <ul class="' + o.progresssteps + '"></ul>\n   <div class="' + o.icon + " " + a.error + '">\n     <span class="swal2-x-mark"><span class="swal2-x-mark-line-left"></span><span class="swal2-x-mark-line-right"></span></span>\n   </div>\n   <div class="' + o.icon + " " + a.question + '">?</div>\n   <div class="' + o.icon + " " + a.warning + '">!</div>\n   <div class="' + o.icon + " " + a.info + '">i</div>\n   <div class="' + o.icon + " " + a.success + '">\n     <div class="swal2-success-circular-line-left"></div>\n     <span class="swal2-success-line-tip"></span> <span class="swal2-success-line-long"></span>\n     <div class="swal2-success-ring"></div> <div class="swal2-success-fix"></div>\n     <div class="swal2-success-circular-line-right"></div>\n   </div>\n   <img class="' + o.image + '" />\n   <div class="' + o.contentwrapper + '">\n   <h2 class="' + o.title + '" id="' + o.title + '"></h2>\n   <div id="' + o.content + '" class="' + o.content + '"></div>\n   </div>\n   <input class="' + o.input + '" />\n   <input type="file" class="' + o.file + '" />\n   <div class="' + o.range + '">\n     <output></output>\n     <input type="range" />\n   </div>\n   <select class="' + o.select + '"></select>\n   <div class="' + o.radio + '"></div>\n   <label for="' + o.checkbox + '" class="' + o.checkbox + '">\n     <input type="checkbox" />\n   </label>\n   <textarea class="' + o.textarea + '"></textarea>\n   <div class="' + o.validationerror + '" id="' + o.validationerror + '"></div>\n   <div class="' + o.buttonswrapper + '">\n     <button type="button" class="' + o.confirm + '">OK</button>\n     <button type="button" class="' + o.cancel + '">Cancel</button>\n   </div>\n   <button type="button" class="' + o.close + '">×</button>\n </div>\n').replace(/(^|\n)\s*/g, ""),
        A = function () {
            return document.body.querySelector("." + o.container)
        },
        B = function () {
            return A() ? A().querySelector("." + o.popup) : null
        },
        P = function () {
            return B().querySelectorAll("." + o.icon)
        },
        E = function (n) {
            return A() ? A().querySelector("." + n) : null
        },
        L = function () {
            return E(o.title)
        },
        T = function () {
            return E(o.content)
        },
        z = function () {
            return E(o.image)
        },
        q = function () {
            return E(o.progresssteps)
        },
        j = function () {
            return E(o.validationerror)
        },
        O = function () {
            return E(o.confirm)
        },
        V = function () {
            return E(o.cancel)
        },
        N = function () {
            return E(o.buttonswrapper)
        },
        Y = function () {
            return E(o.close)
        },
        H = function () {
            var n = Array.from(B().querySelectorAll('[tabindex]:not([tabindex="-1"]):not([tabindex="0"])')).sort(function (n, t) {
                return n = parseInt(n.getAttribute("tabindex")), t = parseInt(t.getAttribute("tabindex")), n > t ? 1 : n < t ? -1 : 0
            }),
                t = Array.prototype.slice.call(B().querySelectorAll('button, input:not([type=hidden]), textarea, select, a, [tabindex="0"]'));
            return function (n) {
                var t = [];
                for (var e in n) - 1 === t.indexOf(n[e]) && t.push(n[e]);
                return t
            }(n.concat(t))
        },
        Z = function () {
            return !document.body.classList.contains(o["toast-shown"])
        },
        M = function () {
            return document.body.classList.contains(o["toast-shown"])
        },
        R = function (n, t) {
            return !!n.classList && n.classList.contains(t)
        },
        I = function (n) {
            if (n.focus(), "file" !== n.type) {
                var t = n.value;
                n.value = "", n.value = t
            }
        },
        X = function (n, t) {
            if (n && t) {
                t.split(/\s+/).filter(Boolean).forEach(function (t) {
                    n.classList.add(t)
                })
            }
        },
        D = function (n, t) {
            if (n && t) {
                t.split(/\s+/).filter(Boolean).forEach(function (t) {
                    n.classList.remove(t)
                })
            }
        },
        $ = function (n, t) {
            for (var e = 0; e < n.childNodes.length; e++)
                if (R(n.childNodes[e], t)) return n.childNodes[e]
        },
        U = function (n, t) {
            t || (t = n === B() || n === N() ? "flex" : "block"), n.style.opacity = "", n.style.display = t
        },
        W = function (n) {
            n.style.opacity = "", n.style.display = "none"
        },
        K = function (n) {
            for (; n.firstChild;) n.removeChild(n.firstChild)
        },
        _ = function (n) {
            return n.offsetWidth || n.offsetHeight || n.getClientRects().length
        },
        Q = function (n, t) {
            n.style.removeProperty ? n.style.removeProperty(t) : n.style.removeAttribute(t)
        },
        J = function () {
            if (v()) return !1;
            var n = document.createElement("div"),
                t = {
                    WebkitAnimation: "webkitAnimationEnd",
                    OAnimation: "oAnimationEnd oanimationend",
                    animation: "animationend"
                };
            for (var e in t)
                if (t.hasOwnProperty(e) && void 0 !== n.style[e]) return t[e];
            return !1
        }(),
        F = function () {
            if (y.previousActiveElement && y.previousActiveElement.focus) {
                var n = window.scrollX,
                    t = window.scrollY;
                y.previousActiveElement.focus(), void 0 !== n && void 0 !== t && window.scrollTo(n, t)
            }
        },
        G = function () {
            if ("ontouchstart" in window || navigator.msMaxTouchPoints) return 0;
            var n = document.createElement("div");
            n.style.width = "50px", n.style.height = "50px", n.style.overflow = "scroll", document.body.appendChild(n);
            var t = n.offsetWidth - n.clientWidth;
            return document.body.removeChild(n), t
        };
    return function () {
        var n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
        if (v()) return !1;
        var t = document.head || document.getElementsByTagName("head")[0],
            e = document.createElement("style");
        e.type = "text/css", t.appendChild(e), e.styleSheet ? e.styleSheet.cssText = n : e.appendChild(document.createTextNode(n))
    }("body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) {\n  overflow-y: hidden; }\n\nbody.swal2-toast-shown {\n  overflow-y: auto; }\n  body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast {\n    -webkit-box-orient: vertical;\n    -webkit-box-direction: normal;\n        -ms-flex-direction: column;\n            flex-direction: column; }\n    body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast .swal2-icon {\n      margin: 0 0 15px; }\n    body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast .swal2-buttonswrapper {\n      -webkit-box-flex: 1;\n          -ms-flex: 1;\n              flex: 1;\n      -ms-flex-item-align: stretch;\n          align-self: stretch;\n      -webkit-box-pack: end;\n          -ms-flex-pack: end;\n              justify-content: flex-end; }\n    body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast .swal2-loading {\n      -webkit-box-pack: center;\n          -ms-flex-pack: center;\n              justify-content: center; }\n    body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast .swal2-input {\n      height: 32px;\n      font-size: 14px;\n      margin: 5px auto; }\n  body.swal2-toast-shown > .swal2-container {\n    position: fixed;\n    background-color: transparent; }\n    body.swal2-toast-shown > .swal2-container.swal2-shown {\n      background-color: transparent; }\n    body.swal2-toast-shown > .swal2-container.swal2-top {\n      top: 0;\n      left: 50%;\n      bottom: auto;\n      right: auto;\n      -webkit-transform: translateX(-50%);\n              transform: translateX(-50%); }\n    body.swal2-toast-shown > .swal2-container.swal2-top-right {\n      top: 0;\n      left: auto;\n      bottom: auto;\n      right: 0; }\n    body.swal2-toast-shown > .swal2-container.swal2-top-left {\n      top: 0;\n      left: 0;\n      bottom: auto;\n      right: auto; }\n    body.swal2-toast-shown > .swal2-container.swal2-center-left {\n      top: 50%;\n      left: 0;\n      bottom: auto;\n      right: auto;\n      -webkit-transform: translateY(-50%);\n              transform: translateY(-50%); }\n    body.swal2-toast-shown > .swal2-container.swal2-center {\n      top: 50%;\n      left: 50%;\n      bottom: auto;\n      right: auto;\n      -webkit-transform: translate(-50%, -50%);\n              transform: translate(-50%, -50%); }\n    body.swal2-toast-shown > .swal2-container.swal2-center-right {\n      top: 50%;\n      left: auto;\n      bottom: auto;\n      right: 0;\n      -webkit-transform: translateY(-50%);\n              transform: translateY(-50%); }\n    body.swal2-toast-shown > .swal2-container.swal2-bottom-left {\n      top: auto;\n      left: 0;\n      bottom: 0;\n      right: auto; }\n    body.swal2-toast-shown > .swal2-container.swal2-bottom {\n      top: auto;\n      left: 50%;\n      bottom: 0;\n      right: auto;\n      -webkit-transform: translateX(-50%);\n              transform: translateX(-50%); }\n    body.swal2-toast-shown > .swal2-container.swal2-bottom-right {\n      top: auto;\n      left: auto;\n      bottom: 0;\n      right: 0; }\n\nbody.swal2-iosfix {\n  position: fixed;\n  left: 0;\n  right: 0; }\n\nbody.swal2-no-backdrop > .swal2-shown {\n  top: auto;\n  bottom: auto;\n  left: auto;\n  right: auto;\n  background-color: transparent; }\n  body.swal2-no-backdrop > .swal2-shown > .swal2-modal {\n    -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);\n            box-shadow: 0 0 10px rgba(0, 0, 0, 0.4); }\n  body.swal2-no-backdrop > .swal2-shown.swal2-top {\n    top: 0;\n    left: 50%;\n    -webkit-transform: translateX(-50%);\n            transform: translateX(-50%); }\n  body.swal2-no-backdrop > .swal2-shown.swal2-top-left {\n    top: 0;\n    left: 0; }\n  body.swal2-no-backdrop > .swal2-shown.swal2-top-right {\n    top: 0;\n    right: 0; }\n  body.swal2-no-backdrop > .swal2-shown.swal2-center {\n    top: 50%;\n    left: 50%;\n    -webkit-transform: translate(-50%, -50%);\n            transform: translate(-50%, -50%); }\n  body.swal2-no-backdrop > .swal2-shown.swal2-center-left {\n    top: 50%;\n    left: 0;\n    -webkit-transform: translateY(-50%);\n            transform: translateY(-50%); }\n  body.swal2-no-backdrop > .swal2-shown.swal2-center-right {\n    top: 50%;\n    right: 0;\n    -webkit-transform: translateY(-50%);\n            transform: translateY(-50%); }\n  body.swal2-no-backdrop > .swal2-shown.swal2-bottom {\n    bottom: 0;\n    left: 50%;\n    -webkit-transform: translateX(-50%);\n            transform: translateX(-50%); }\n  body.swal2-no-backdrop > .swal2-shown.swal2-bottom-left {\n    bottom: 0;\n    left: 0; }\n  body.swal2-no-backdrop > .swal2-shown.swal2-bottom-right {\n    bottom: 0;\n    right: 0; }\n\n.swal2-container {\n  display: -webkit-box;\n  display: -ms-flexbox;\n  display: flex;\n  -webkit-box-orient: horizontal;\n  -webkit-box-direction: normal;\n      -ms-flex-direction: row;\n          flex-direction: row;\n  -webkit-box-align: center;\n      -ms-flex-align: center;\n          align-items: center;\n  -webkit-box-pack: center;\n      -ms-flex-pack: center;\n          justify-content: center;\n  position: fixed;\n  padding: 10px;\n  top: 0;\n  left: 0;\n  right: 0;\n  bottom: 0;\n  background-color: transparent;\n  z-index: 1060; }\n  .swal2-container.swal2-top {\n    -webkit-box-align: start;\n        -ms-flex-align: start;\n            align-items: flex-start; }\n  .swal2-container.swal2-top-left {\n    -webkit-box-align: start;\n        -ms-flex-align: start;\n            align-items: flex-start;\n    -webkit-box-pack: start;\n        -ms-flex-pack: start;\n            justify-content: flex-start; }\n  .swal2-container.swal2-top-right {\n    -webkit-box-align: start;\n        -ms-flex-align: start;\n            align-items: flex-start;\n    -webkit-box-pack: end;\n        -ms-flex-pack: end;\n            justify-content: flex-end; }\n  .swal2-container.swal2-center {\n    -webkit-box-align: center;\n        -ms-flex-align: center;\n            align-items: center; }\n  .swal2-container.swal2-center-left {\n    -webkit-box-align: center;\n        -ms-flex-align: center;\n            align-items: center;\n    -webkit-box-pack: start;\n        -ms-flex-pack: start;\n            justify-content: flex-start; }\n  .swal2-container.swal2-center-right {\n    -webkit-box-align: center;\n        -ms-flex-align: center;\n            align-items: center;\n    -webkit-box-pack: end;\n        -ms-flex-pack: end;\n            justify-content: flex-end; }\n  .swal2-container.swal2-bottom {\n    -webkit-box-align: end;\n        -ms-flex-align: end;\n            align-items: flex-end; }\n  .swal2-container.swal2-bottom-left {\n    -webkit-box-align: end;\n        -ms-flex-align: end;\n            align-items: flex-end;\n    -webkit-box-pack: start;\n        -ms-flex-pack: start;\n            justify-content: flex-start; }\n  .swal2-container.swal2-bottom-right {\n    -webkit-box-align: end;\n        -ms-flex-align: end;\n            align-items: flex-end;\n    -webkit-box-pack: end;\n        -ms-flex-pack: end;\n            justify-content: flex-end; }\n  .swal2-container.swal2-grow-fullscreen > .swal2-modal {\n    display: -webkit-box !important;\n    display: -ms-flexbox !important;\n    display: flex !important;\n    -webkit-box-flex: 1;\n        -ms-flex: 1;\n            flex: 1;\n    -ms-flex-item-align: stretch;\n        align-self: stretch;\n    -webkit-box-pack: center;\n        -ms-flex-pack: center;\n            justify-content: center; }\n  .swal2-container.swal2-grow-row > .swal2-modal {\n    display: -webkit-box !important;\n    display: -ms-flexbox !important;\n    display: flex !important;\n    -webkit-box-flex: 1;\n        -ms-flex: 1;\n            flex: 1;\n    -ms-flex-line-pack: center;\n        align-content: center;\n    -webkit-box-pack: center;\n        -ms-flex-pack: center;\n            justify-content: center; }\n  .swal2-container.swal2-grow-column {\n    -webkit-box-flex: 1;\n        -ms-flex: 1;\n            flex: 1;\n    -webkit-box-orient: vertical;\n    -webkit-box-direction: normal;\n        -ms-flex-direction: column;\n            flex-direction: column; }\n    .swal2-container.swal2-grow-column.swal2-top, .swal2-container.swal2-grow-column.swal2-center, .swal2-container.swal2-grow-column.swal2-bottom {\n      -webkit-box-align: center;\n          -ms-flex-align: center;\n              align-items: center; }\n    .swal2-container.swal2-grow-column.swal2-top-left, .swal2-container.swal2-grow-column.swal2-center-left, .swal2-container.swal2-grow-column.swal2-bottom-left {\n      -webkit-box-align: start;\n          -ms-flex-align: start;\n              align-items: flex-start; }\n    .swal2-container.swal2-grow-column.swal2-top-right, .swal2-container.swal2-grow-column.swal2-center-right, .swal2-container.swal2-grow-column.swal2-bottom-right {\n      -webkit-box-align: end;\n          -ms-flex-align: end;\n              align-items: flex-end; }\n    .swal2-container.swal2-grow-column > .swal2-modal {\n      display: -webkit-box !important;\n      display: -ms-flexbox !important;\n      display: flex !important;\n      -webkit-box-flex: 1;\n          -ms-flex: 1;\n              flex: 1;\n      -ms-flex-line-pack: center;\n          align-content: center;\n      -webkit-box-pack: center;\n          -ms-flex-pack: center;\n              justify-content: center; }\n  .swal2-container:not(.swal2-top):not(.swal2-top-left):not(.swal2-top-right):not(.swal2-center-left):not(.swal2-center-right):not(.swal2-bottom):not(.swal2-bottom-left):not(.swal2-bottom-right) > .swal2-modal {\n    margin: auto; }\n  @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {\n    .swal2-container .swal2-modal {\n      margin: 0 !important; } }\n  .swal2-container.swal2-fade {\n    -webkit-transition: background-color .1s;\n    transition: background-color .1s; }\n  .swal2-container.swal2-shown {\n    background-color: rgba(0, 0, 0, 0.4); }\n\n.swal2-popup {\n  -webkit-box-orient: vertical;\n  -webkit-box-direction: normal;\n      -ms-flex-direction: column;\n          flex-direction: column;\n  background-color: #fff;\n  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;\n  border-radius: 5px;\n  -webkit-box-sizing: border-box;\n          box-sizing: border-box;\n  text-align: center;\n  overflow-x: hidden;\n  overflow-y: auto;\n  display: none;\n  position: relative;\n  max-width: 100%; }\n  .swal2-popup.swal2-toast {\n    width: 300px;\n    padding: 0 15px;\n    -webkit-box-orient: horizontal;\n    -webkit-box-direction: normal;\n        -ms-flex-direction: row;\n            flex-direction: row;\n    -webkit-box-align: center;\n        -ms-flex-align: center;\n            align-items: center;\n    overflow-y: hidden;\n    -webkit-box-shadow: 0 0 10px #d9d9d9;\n            box-shadow: 0 0 10px #d9d9d9; }\n    .swal2-popup.swal2-toast .swal2-title {\n      max-width: 300px;\n      font-size: 16px;\n      text-align: left; }\n    .swal2-popup.swal2-toast .swal2-content {\n      font-size: 14px;\n      text-align: left; }\n    .swal2-popup.swal2-toast .swal2-icon {\n      width: 32px;\n      min-width: 32px;\n      height: 32px;\n      margin: 0 15px 0 0; }\n      .swal2-popup.swal2-toast .swal2-icon.swal2-success .swal2-success-ring {\n        width: 32px;\n        height: 32px; }\n      .swal2-popup.swal2-toast .swal2-icon.swal2-info, .swal2-popup.swal2-toast .swal2-icon.swal2-warning, .swal2-popup.swal2-toast .swal2-icon.swal2-question {\n        font-size: 26px;\n        line-height: 32px; }\n      .swal2-popup.swal2-toast .swal2-icon.swal2-error [class^='swal2-x-mark-line'] {\n        top: 14px;\n        width: 22px; }\n        .swal2-popup.swal2-toast .swal2-icon.swal2-error [class^='swal2-x-mark-line'][class$='left'] {\n          left: 5px; }\n        .swal2-popup.swal2-toast .swal2-icon.swal2-error [class^='swal2-x-mark-line'][class$='right'] {\n          right: 5px; }\n    .swal2-popup.swal2-toast .swal2-buttonswrapper {\n      margin: 0 0 0 5px; }\n    .swal2-popup.swal2-toast .swal2-styled {\n      margin: 0 0 0 5px;\n      padding: 5px 10px; }\n      .swal2-popup.swal2-toast .swal2-styled:focus {\n        -webkit-box-shadow: 0 0 0 1px #fff, 0 0 0 2px rgba(50, 100, 150, 0.4);\n                box-shadow: 0 0 0 1px #fff, 0 0 0 2px rgba(50, 100, 150, 0.4); }\n    .swal2-popup.swal2-toast .swal2-validationerror {\n      width: 100%;\n      margin: 5px -20px; }\n    .swal2-popup.swal2-toast .swal2-success {\n      border-color: #a5dc86; }\n      .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-circular-line'] {\n        border-radius: 50%;\n        position: absolute;\n        width: 32px;\n        height: 64px;\n        -webkit-transform: rotate(45deg);\n                transform: rotate(45deg); }\n        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-circular-line'][class$='left'] {\n          border-radius: 64px 0 0 64px;\n          top: -4px;\n          left: -15px;\n          -webkit-transform: rotate(-45deg);\n                  transform: rotate(-45deg);\n          -webkit-transform-origin: 32px 32px;\n                  transform-origin: 32px 32px; }\n        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-circular-line'][class$='right'] {\n          border-radius: 0 64px 64px 0;\n          top: -5px;\n          left: 14px;\n          -webkit-transform-origin: 0 32px;\n                  transform-origin: 0 32px; }\n      .swal2-popup.swal2-toast .swal2-success .swal2-success-ring {\n        width: 32px;\n        height: 32px; }\n      .swal2-popup.swal2-toast .swal2-success .swal2-success-fix {\n        width: 7px;\n        height: 90px;\n        left: 28px;\n        top: 8px; }\n      .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-line'] {\n        height: 5px; }\n        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-line'][class$='tip'] {\n          width: 12px;\n          left: 3px;\n          top: 18px; }\n        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-line'][class$='long'] {\n          width: 22px;\n          right: 3px;\n          top: 15px; }\n    .swal2-popup.swal2-toast .swal2-animate-success-line-tip {\n      -webkit-animation: animate-toast-success-tip .75s;\n              animation: animate-toast-success-tip .75s; }\n    .swal2-popup.swal2-toast .swal2-animate-success-line-long {\n      -webkit-animation: animate-toast-success-long .75s;\n              animation: animate-toast-success-long .75s; }\n  .swal2-popup:focus {\n    outline: none; }\n  .swal2-popup.swal2-loading {\n    overflow-y: hidden; }\n  .swal2-popup .swal2-title {\n    color: #595959;\n    font-size: 30px;\n    text-align: center;\n    font-weight: 600;\n    text-transform: none;\n    position: relative;\n    margin: 0 0 .4em;\n    padding: 0;\n    display: block;\n    word-wrap: break-word; }\n  .swal2-popup .swal2-buttonswrapper {\n    -webkit-box-align: center;\n        -ms-flex-align: center;\n            align-items: center;\n    -webkit-box-pack: center;\n        -ms-flex-pack: center;\n            justify-content: center;\n    margin-top: 15px; }\n    .swal2-popup .swal2-buttonswrapper:not(.swal2-loading) .swal2-styled[disabled] {\n      opacity: .4;\n      cursor: no-drop; }\n    .swal2-popup .swal2-buttonswrapper.swal2-loading .swal2-styled.swal2-confirm {\n      -webkit-box-sizing: border-box;\n              box-sizing: border-box;\n      border: 4px solid transparent;\n      border-color: transparent;\n      width: 40px;\n      height: 40px;\n      padding: 0;\n      margin: 7.5px;\n      vertical-align: top;\n      background-color: transparent !important;\n      color: transparent;\n      cursor: default;\n      border-radius: 100%;\n      -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;\n              animation: rotate-loading 1.5s linear 0s infinite normal;\n      -webkit-user-select: none;\n         -moz-user-select: none;\n          -ms-user-select: none;\n              user-select: none; }\n    .swal2-popup .swal2-buttonswrapper.swal2-loading .swal2-styled.swal2-cancel {\n      margin-left: 30px;\n      margin-right: 30px; }\n    .swal2-popup .swal2-buttonswrapper.swal2-loading :not(.swal2-styled).swal2-confirm::after {\n      display: inline-block;\n      content: '';\n      margin-left: 5px;\n      vertical-align: -1px;\n      height: 15px;\n      width: 15px;\n      border: 3px solid #999999;\n      -webkit-box-shadow: 1px 1px 1px #fff;\n              box-shadow: 1px 1px 1px #fff;\n      border-right-color: transparent;\n      border-radius: 50%;\n      -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;\n              animation: rotate-loading 1.5s linear 0s infinite normal; }\n  .swal2-popup .swal2-styled {\n    border: 0;\n    border-radius: 3px;\n    -webkit-box-shadow: none;\n            box-shadow: none;\n    color: #fff;\n    cursor: pointer;\n    font-size: 17px;\n    font-weight: 500;\n    margin: 15px 5px 0;\n    padding: 10px 32px; }\n    .swal2-popup .swal2-styled:focus {\n      outline: none;\n      -webkit-box-shadow: 0 0 0 2px #fff, 0 0 0 4px rgba(50, 100, 150, 0.4);\n              box-shadow: 0 0 0 2px #fff, 0 0 0 4px rgba(50, 100, 150, 0.4); }\n  .swal2-popup .swal2-image {\n    margin: 20px auto;\n    max-width: 100%; }\n  .swal2-popup .swal2-close {\n    background: transparent;\n    border: 0;\n    margin: 0;\n    padding: 0;\n    width: 38px;\n    height: 40px;\n    font-size: 36px;\n    line-height: 40px;\n    font-family: serif;\n    position: absolute;\n    top: 5px;\n    right: 8px;\n    cursor: pointer;\n    color: #cccccc;\n    -webkit-transition: color .1s ease;\n    transition: color .1s ease; }\n    .swal2-popup .swal2-close:hover {\n      color: #d55; }\n  .swal2-popup > .swal2-input,\n  .swal2-popup > .swal2-file,\n  .swal2-popup > .swal2-textarea,\n  .swal2-popup > .swal2-select,\n  .swal2-popup > .swal2-radio,\n  .swal2-popup > .swal2-checkbox {\n    display: none; }\n  .swal2-popup .swal2-content {\n    font-family: IranSans;\nfont-size: 18px;\n    text-align: center;\n    font-weight: 300;\n    position: relative;\n    float: none;\n    margin: 0;\n    padding: 0;\n    line-height: normal;\n    color: #545454;\n    word-wrap: break-word; }\n  .swal2-popup .swal2-input,\n  .swal2-popup .swal2-file,\n  .swal2-popup .swal2-textarea,\n  .swal2-popup .swal2-select,\n  .swal2-popup .swal2-radio,\n  .swal2-popup .swal2-checkbox {\n    margin: 20px auto; }\n  .swal2-popup .swal2-input,\n  .swal2-popup .swal2-file,\n  .swal2-popup .swal2-textarea {\n    width: 100%;\n    -webkit-box-sizing: border-box;\n            box-sizing: border-box;\n    font-size: 18px;\n    border-radius: 3px;\n    border: 1px solid #d9d9d9;\n    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.06);\n            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.06);\n    -webkit-transition: border-color .3s, -webkit-box-shadow .3s;\n    transition: border-color .3s, -webkit-box-shadow .3s;\n    transition: border-color .3s, box-shadow .3s;\n    transition: border-color .3s, box-shadow .3s, -webkit-box-shadow .3s; }\n    .swal2-popup .swal2-input.swal2-inputerror,\n    .swal2-popup .swal2-file.swal2-inputerror,\n    .swal2-popup .swal2-textarea.swal2-inputerror {\n      border-color: #f27474 !important;\n      -webkit-box-shadow: 0 0 2px #f27474 !important;\n              box-shadow: 0 0 2px #f27474 !important; }\n    .swal2-popup .swal2-input:focus,\n    .swal2-popup .swal2-file:focus,\n    .swal2-popup .swal2-textarea:focus {\n      outline: none;\n      border: 1px solid #b4dbed;\n      -webkit-box-shadow: 0 0 3px #c4e6f5;\n              box-shadow: 0 0 3px #c4e6f5; }\n    .swal2-popup .swal2-input::-webkit-input-placeholder,\n    .swal2-popup .swal2-file::-webkit-input-placeholder,\n    .swal2-popup .swal2-textarea::-webkit-input-placeholder {\n      color: #cccccc; }\n    .swal2-popup .swal2-input:-ms-input-placeholder,\n    .swal2-popup .swal2-file:-ms-input-placeholder,\n    .swal2-popup .swal2-textarea:-ms-input-placeholder {\n      color: #cccccc; }\n    .swal2-popup .swal2-input::-ms-input-placeholder,\n    .swal2-popup .swal2-file::-ms-input-placeholder,\n    .swal2-popup .swal2-textarea::-ms-input-placeholder {\n      color: #cccccc; }\n    .swal2-popup .swal2-input::placeholder,\n    .swal2-popup .swal2-file::placeholder,\n    .swal2-popup .swal2-textarea::placeholder {\n      color: #cccccc; }\n  .swal2-popup .swal2-range input {\n    float: left;\n    width: 80%; }\n  .swal2-popup .swal2-range output {\n    float: right;\n    width: 20%;\n    font-size: 20px;\n    font-weight: 600;\n    text-align: center; }\n  .swal2-popup .swal2-range input,\n  .swal2-popup .swal2-range output {\n    height: 43px;\n    line-height: 43px;\n    vertical-align: middle;\n    margin: 20px auto;\n    padding: 0; }\n  .swal2-popup .swal2-input {\n    height: 43px;\n    padding: 0 12px; }\n    .swal2-popup .swal2-input[type='number'] {\n      max-width: 150px; }\n  .swal2-popup .swal2-file {\n    font-size: 20px; }\n  .swal2-popup .swal2-textarea {\n    height: 108px;\n    padding: 12px; }\n  .swal2-popup .swal2-select {\n    color: #545454;\n    font-size: inherit;\n    padding: 5px 10px;\n    min-width: 40%;\n    max-width: 100%; }\n  .swal2-popup .swal2-radio {\n    border: 0; }\n    .swal2-popup .swal2-radio label:not(:first-child) {\n      margin-left: 20px; }\n    .swal2-popup .swal2-radio input,\n    .swal2-popup .swal2-radio span {\n      vertical-align: middle; }\n    .swal2-popup .swal2-radio input {\n      margin: 0 3px 0 0; }\n  .swal2-popup .swal2-checkbox {\n    color: #545454; }\n    .swal2-popup .swal2-checkbox input,\n    .swal2-popup .swal2-checkbox span {\n      vertical-align: middle; }\n  .swal2-popup .swal2-validationerror {\n    background-color: #f0f0f0;\n    margin: 0 -20px;\n    overflow: hidden;\n    padding: 10px;\n    color: gray;\n    font-size: 16px;\n    font-weight: 300;\n    display: none; }\n    .swal2-popup .swal2-validationerror::before {\n      content: '!';\n      display: inline-block;\n      width: 24px;\n      height: 24px;\n      border-radius: 50%;\n      background-color: #ea7d7d;\n      color: #fff;\n      line-height: 24px;\n      text-align: center;\n      margin-right: 10px; }\n\n@supports (-ms-accelerator: true) {\n  .swal2-range input {\n    width: 100% !important; }\n  .swal2-range output {\n    display: none; } }\n\n@media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {\n  .swal2-range input {\n    width: 100% !important; }\n  .swal2-range output {\n    display: none; } }\n\n.swal2-icon {\n  width: 80px;\n  height: 80px;\n  border: 4px solid transparent;\n  border-radius: 50%;\n  margin: 20px auto 30px;\n  padding: 0;\n  position: relative;\n  -webkit-box-sizing: content-box;\n          box-sizing: content-box;\n  cursor: default;\n  -webkit-user-select: none;\n     -moz-user-select: none;\n      -ms-user-select: none;\n          user-select: none; }\n  .swal2-icon.swal2-error {\n    border-color: #f27474; }\n    .swal2-icon.swal2-error .swal2-x-mark {\n      position: relative;\n      display: block; }\n    .swal2-icon.swal2-error [class^='swal2-x-mark-line'] {\n      position: absolute;\n      height: 5px;\n      width: 47px;\n      background-color: #f27474;\n      display: block;\n      top: 37px;\n      border-radius: 2px; }\n      .swal2-icon.swal2-error [class^='swal2-x-mark-line'][class$='left'] {\n        -webkit-transform: rotate(45deg);\n                transform: rotate(45deg);\n        left: 17px; }\n      .swal2-icon.swal2-error [class^='swal2-x-mark-line'][class$='right'] {\n        -webkit-transform: rotate(-45deg);\n                transform: rotate(-45deg);\n        right: 16px; }\n  .swal2-icon.swal2-warning {\n    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;\n    color: #f8bb86;\n    border-color: #facea8;\n    font-size: 60px;\n    line-height: 80px;\n    text-align: center; }\n  .swal2-icon.swal2-info {\n    font-family: 'Open Sans', sans-serif;\n    color: #3fc3ee;\n    border-color: #9de0f6;\n    font-size: 60px;\n    line-height: 80px;\n    text-align: center; }\n  .swal2-icon.swal2-question {\n    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;\n    color: #87adbd;\n    border-color: #c9dae1;\n    font-size: 60px;\n    line-height: 80px;\n    text-align: center; }\n  .swal2-icon.swal2-success {\n    border-color: #a5dc86; }\n    .swal2-icon.swal2-success [class^='swal2-success-circular-line'] {\n      border-radius: 50%;\n      position: absolute;\n      width: 60px;\n      height: 120px;\n      -webkit-transform: rotate(45deg);\n              transform: rotate(45deg); }\n      .swal2-icon.swal2-success [class^='swal2-success-circular-line'][class$='left'] {\n        border-radius: 120px 0 0 120px;\n        top: -7px;\n        left: -33px;\n        -webkit-transform: rotate(-45deg);\n                transform: rotate(-45deg);\n        -webkit-transform-origin: 60px 60px;\n                transform-origin: 60px 60px; }\n      .swal2-icon.swal2-success [class^='swal2-success-circular-line'][class$='right'] {\n        border-radius: 0 120px 120px 0;\n        top: -11px;\n        left: 30px;\n        -webkit-transform: rotate(-45deg);\n                transform: rotate(-45deg);\n        -webkit-transform-origin: 0 60px;\n                transform-origin: 0 60px; }\n    .swal2-icon.swal2-success .swal2-success-ring {\n      width: 80px;\n      height: 80px;\n      border: 4px solid rgba(165, 220, 134, 0.2);\n      border-radius: 50%;\n      -webkit-box-sizing: content-box;\n              box-sizing: content-box;\n      position: absolute;\n      left: -4px;\n      top: -4px;\n      z-index: 2; }\n    .swal2-icon.swal2-success .swal2-success-fix {\n      width: 7px;\n      height: 90px;\n      position: absolute;\n      left: 28px;\n      top: 8px;\n      z-index: 1;\n      -webkit-transform: rotate(-45deg);\n              transform: rotate(-45deg); }\n    .swal2-icon.swal2-success [class^='swal2-success-line'] {\n      height: 5px;\n      background-color: #a5dc86;\n      display: block;\n      border-radius: 2px;\n      position: absolute;\n      z-index: 2; }\n      .swal2-icon.swal2-success [class^='swal2-success-line'][class$='tip'] {\n        width: 25px;\n        left: 14px;\n        top: 46px;\n        -webkit-transform: rotate(45deg);\n                transform: rotate(45deg); }\n      .swal2-icon.swal2-success [class^='swal2-success-line'][class$='long'] {\n        width: 47px;\n        right: 8px;\n        top: 38px;\n        -webkit-transform: rotate(-45deg);\n                transform: rotate(-45deg); }\n\n.swal2-progresssteps {\n  font-weight: 600;\n  margin: 0 0 20px;\n  padding: 0; }\n  .swal2-progresssteps li {\n    display: inline-block;\n    position: relative; }\n  .swal2-progresssteps .swal2-progresscircle {\n    background: #3085d6;\n    border-radius: 2em;\n    color: #fff;\n    height: 2em;\n    line-height: 2em;\n    text-align: center;\n    width: 2em;\n    z-index: 20; }\n    .swal2-progresssteps .swal2-progresscircle:first-child {\n      margin-left: 0; }\n    .swal2-progresssteps .swal2-progresscircle:last-child {\n      margin-right: 0; }\n    .swal2-progresssteps .swal2-progresscircle.swal2-activeprogressstep {\n      background: #3085d6; }\n      .swal2-progresssteps .swal2-progresscircle.swal2-activeprogressstep ~ .swal2-progresscircle {\n        background: #add8e6; }\n      .swal2-progresssteps .swal2-progresscircle.swal2-activeprogressstep ~ .swal2-progressline {\n        background: #add8e6; }\n  .swal2-progresssteps .swal2-progressline {\n    background: #3085d6;\n    height: .4em;\n    margin: 0 -1px;\n    z-index: 10; }\n\n[class^='swal2'] {\n  -webkit-tap-highlight-color: transparent; }\n\n@-webkit-keyframes showSweetToast {\n  0% {\n    -webkit-transform: translateY(-10px) rotateZ(2deg);\n            transform: translateY(-10px) rotateZ(2deg);\n    opacity: 0; }\n  33% {\n    -webkit-transform: translateY(0) rotateZ(-2deg);\n            transform: translateY(0) rotateZ(-2deg);\n    opacity: .5; }\n  66% {\n    -webkit-transform: translateY(5px) rotateZ(2deg);\n            transform: translateY(5px) rotateZ(2deg);\n    opacity: .7; }\n  100% {\n    -webkit-transform: translateY(0) rotateZ(0);\n            transform: translateY(0) rotateZ(0);\n    opacity: 1; } }\n\n@keyframes showSweetToast {\n  0% {\n    -webkit-transform: translateY(-10px) rotateZ(2deg);\n            transform: translateY(-10px) rotateZ(2deg);\n    opacity: 0; }\n  33% {\n    -webkit-transform: translateY(0) rotateZ(-2deg);\n            transform: translateY(0) rotateZ(-2deg);\n    opacity: .5; }\n  66% {\n    -webkit-transform: translateY(5px) rotateZ(2deg);\n            transform: translateY(5px) rotateZ(2deg);\n    opacity: .7; }\n  100% {\n    -webkit-transform: translateY(0) rotateZ(0);\n            transform: translateY(0) rotateZ(0);\n    opacity: 1; } }\n\n@-webkit-keyframes hideSweetToast {\n  0% {\n    opacity: 1; }\n  33% {\n    opacity: .5; }\n  100% {\n    -webkit-transform: rotateZ(1deg);\n            transform: rotateZ(1deg);\n    opacity: 0; } }\n\n@keyframes hideSweetToast {\n  0% {\n    opacity: 1; }\n  33% {\n    opacity: .5; }\n  100% {\n    -webkit-transform: rotateZ(1deg);\n            transform: rotateZ(1deg);\n    opacity: 0; } }\n\n@-webkit-keyframes showSweetAlert {\n  0% {\n    -webkit-transform: scale(0.7);\n            transform: scale(0.7); }\n  45% {\n    -webkit-transform: scale(1.05);\n            transform: scale(1.05); }\n  80% {\n    -webkit-transform: scale(0.95);\n            transform: scale(0.95); }\n  100% {\n    -webkit-transform: scale(1);\n            transform: scale(1); } }\n\n@keyframes showSweetAlert {\n  0% {\n    -webkit-transform: scale(0.7);\n            transform: scale(0.7); }\n  45% {\n    -webkit-transform: scale(1.05);\n            transform: scale(1.05); }\n  80% {\n    -webkit-transform: scale(0.95);\n            transform: scale(0.95); }\n  100% {\n    -webkit-transform: scale(1);\n            transform: scale(1); } }\n\n@-webkit-keyframes hideSweetAlert {\n  0% {\n    -webkit-transform: scale(1);\n            transform: scale(1);\n    opacity: 1; }\n  100% {\n    -webkit-transform: scale(0.5);\n            transform: scale(0.5);\n    opacity: 0; } }\n\n@keyframes hideSweetAlert {\n  0% {\n    -webkit-transform: scale(1);\n            transform: scale(1);\n    opacity: 1; }\n  100% {\n    -webkit-transform: scale(0.5);\n            transform: scale(0.5);\n    opacity: 0; } }\n\n.swal2-show {\n  -webkit-animation: showSweetAlert .3s;\n          animation: showSweetAlert .3s; }\n  .swal2-show.swal2-toast {\n    -webkit-animation: showSweetToast .5s;\n            animation: showSweetToast .5s; }\n  .swal2-show.swal2-noanimation {\n    -webkit-animation: none;\n            animation: none; }\n\n.swal2-hide {\n  -webkit-animation: hideSweetAlert .15s forwards;\n          animation: hideSweetAlert .15s forwards; }\n  .swal2-hide.swal2-toast {\n    -webkit-animation: hideSweetToast .2s forwards;\n            animation: hideSweetToast .2s forwards; }\n  .swal2-hide.swal2-noanimation {\n    -webkit-animation: none;\n            animation: none; }\n\n@-webkit-keyframes animate-success-tip {\n  0% {\n    width: 0;\n    left: 1px;\n    top: 19px; }\n  54% {\n    width: 0;\n    left: 1px;\n    top: 19px; }\n  70% {\n    width: 50px;\n    left: -8px;\n    top: 37px; }\n  84% {\n    width: 17px;\n    left: 21px;\n    top: 48px; }\n  100% {\n    width: 25px;\n    left: 14px;\n    top: 45px; } }\n\n@keyframes animate-success-tip {\n  0% {\n    width: 0;\n    left: 1px;\n    top: 19px; }\n  54% {\n    width: 0;\n    left: 1px;\n    top: 19px; }\n  70% {\n    width: 50px;\n    left: -8px;\n    top: 37px; }\n  84% {\n    width: 17px;\n    left: 21px;\n    top: 48px; }\n  100% {\n    width: 25px;\n    left: 14px;\n    top: 45px; } }\n\n@-webkit-keyframes animate-success-long {\n  0% {\n    width: 0;\n    right: 46px;\n    top: 54px; }\n  65% {\n    width: 0;\n    right: 46px;\n    top: 54px; }\n  84% {\n    width: 55px;\n    right: 0;\n    top: 35px; }\n  100% {\n    width: 47px;\n    right: 8px;\n    top: 38px; } }\n\n@keyframes animate-success-long {\n  0% {\n    width: 0;\n    right: 46px;\n    top: 54px; }\n  65% {\n    width: 0;\n    right: 46px;\n    top: 54px; }\n  84% {\n    width: 55px;\n    right: 0;\n    top: 35px; }\n  100% {\n    width: 47px;\n    right: 8px;\n    top: 38px; } }\n\n@-webkit-keyframes animate-toast-success-tip {\n  0% {\n    width: 0;\n    left: 1px;\n    top: 9px; }\n  54% {\n    width: 0;\n    left: 1px;\n    top: 9px; }\n  70% {\n    width: 24px;\n    left: -4px;\n    top: 17px; }\n  84% {\n    width: 8px;\n    left: 10px;\n    top: 20px; }\n  100% {\n    width: 12px;\n    left: 3px;\n    top: 18px; } }\n\n@keyframes animate-toast-success-tip {\n  0% {\n    width: 0;\n    left: 1px;\n    top: 9px; }\n  54% {\n    width: 0;\n    left: 1px;\n    top: 9px; }\n  70% {\n    width: 24px;\n    left: -4px;\n    top: 17px; }\n  84% {\n    width: 8px;\n    left: 10px;\n    top: 20px; }\n  100% {\n    width: 12px;\n    left: 3px;\n    top: 18px; } }\n\n@-webkit-keyframes animate-toast-success-long {\n  0% {\n    width: 0;\n    right: 22px;\n    top: 26px; }\n  65% {\n    width: 0;\n    right: 22px;\n    top: 26px; }\n  84% {\n    width: 26px;\n    right: 0;\n    top: 15px; }\n  100% {\n    width: 22px;\n    right: 3px;\n    top: 15px; } }\n\n@keyframes animate-toast-success-long {\n  0% {\n    width: 0;\n    right: 22px;\n    top: 26px; }\n  65% {\n    width: 0;\n    right: 22px;\n    top: 26px; }\n  84% {\n    width: 26px;\n    right: 0;\n    top: 15px; }\n  100% {\n    width: 22px;\n    right: 3px;\n    top: 15px; } }\n\n@-webkit-keyframes rotatePlaceholder {\n  0% {\n    -webkit-transform: rotate(-45deg);\n            transform: rotate(-45deg); }\n  5% {\n    -webkit-transform: rotate(-45deg);\n            transform: rotate(-45deg); }\n  12% {\n    -webkit-transform: rotate(-405deg);\n            transform: rotate(-405deg); }\n  100% {\n    -webkit-transform: rotate(-405deg);\n            transform: rotate(-405deg); } }\n\n@keyframes rotatePlaceholder {\n  0% {\n    -webkit-transform: rotate(-45deg);\n            transform: rotate(-45deg); }\n  5% {\n    -webkit-transform: rotate(-45deg);\n            transform: rotate(-45deg); }\n  12% {\n    -webkit-transform: rotate(-405deg);\n            transform: rotate(-405deg); }\n  100% {\n    -webkit-transform: rotate(-405deg);\n            transform: rotate(-405deg); } }\n\n.swal2-animate-success-line-tip {\n  -webkit-animation: animate-success-tip .75s;\n          animation: animate-success-tip .75s; }\n\n.swal2-animate-success-line-long {\n  -webkit-animation: animate-success-long .75s;\n          animation: animate-success-long .75s; }\n\n.swal2-success.swal2-animate-success-icon .swal2-success-circular-line-right {\n  -webkit-animation: rotatePlaceholder 4.25s ease-in;\n          animation: rotatePlaceholder 4.25s ease-in; }\n\n@-webkit-keyframes animate-error-icon {\n  0% {\n    -webkit-transform: rotateX(100deg);\n            transform: rotateX(100deg);\n    opacity: 0; }\n  100% {\n    -webkit-transform: rotateX(0deg);\n            transform: rotateX(0deg);\n    opacity: 1; } }\n\n@keyframes animate-error-icon {\n  0% {\n    -webkit-transform: rotateX(100deg);\n            transform: rotateX(100deg);\n    opacity: 0; }\n  100% {\n    -webkit-transform: rotateX(0deg);\n            transform: rotateX(0deg);\n    opacity: 1; } }\n\n.swal2-animate-error-icon {\n  -webkit-animation: animate-error-icon .5s;\n          animation: animate-error-icon .5s; }\n\n@-webkit-keyframes animate-x-mark {\n  0% {\n    -webkit-transform: scale(0.4);\n            transform: scale(0.4);\n    margin-top: 26px;\n    opacity: 0; }\n  50% {\n    -webkit-transform: scale(0.4);\n            transform: scale(0.4);\n    margin-top: 26px;\n    opacity: 0; }\n  80% {\n    -webkit-transform: scale(1.15);\n            transform: scale(1.15);\n    margin-top: -6px; }\n  100% {\n    -webkit-transform: scale(1);\n            transform: scale(1);\n    margin-top: 0;\n    opacity: 1; } }\n\n@keyframes animate-x-mark {\n  0% {\n    -webkit-transform: scale(0.4);\n            transform: scale(0.4);\n    margin-top: 26px;\n    opacity: 0; }\n  50% {\n    -webkit-transform: scale(0.4);\n            transform: scale(0.4);\n    margin-top: 26px;\n    opacity: 0; }\n  80% {\n    -webkit-transform: scale(1.15);\n            transform: scale(1.15);\n    margin-top: -6px; }\n  100% {\n    -webkit-transform: scale(1);\n            transform: scale(1);\n    margin-top: 0;\n    opacity: 1; } }\n\n.swal2-animate-x-mark {\n  -webkit-animation: animate-x-mark .5s;\n          animation: animate-x-mark .5s; }\n\n@-webkit-keyframes rotate-loading {\n  0% {\n    -webkit-transform: rotate(0deg);\n            transform: rotate(0deg); }\n  100% {\n    -webkit-transform: rotate(360deg);\n            transform: rotate(360deg); } }\n\n@keyframes rotate-loading {\n  0% {\n    -webkit-transform: rotate(0deg);\n            transform: rotate(0deg); }\n  100% {\n    -webkit-transform: rotate(360deg);\n            transform: rotate(360deg); } }\n"), k}), "undefined" != typeof window && window.Sweetalert2 && (window.sweetAlert = window.swal = window.Sweetalert2);