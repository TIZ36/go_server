package svc1

import (
	"net/http"

	"app/internal/logic/svc1"
	"app/internal/svc"
	"app/internal/types"
	"github.com/zeromicro/go-zero/rest/httpx"
)

func AuthHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var req types.AuthReq
		if err := httpx.Parse(r, &req); err != nil {
			httpx.Error(w, err)
			return
		}

		l := svc1.NewAuthLogic(r.Context(), svcCtx)
		resp, err := l.Auth(&req)
		if err != nil {
			httpx.Error(w, err)
		} else {
			httpx.OkJson(w, resp)
		}
	}
}
