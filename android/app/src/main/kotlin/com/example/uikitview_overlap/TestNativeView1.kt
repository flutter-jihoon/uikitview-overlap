package com.example.uikitview_overlap

import android.annotation.SuppressLint
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.view.LayoutInflater
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

@SuppressLint("InflateParams")
internal class TestNativeView1(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val view: View

    override fun getView(): View {
        return view
    }

    override fun dispose() {}

    init {
        val inflater = LayoutInflater.from(context)
        view = inflater.inflate(R.layout.test_native_view1, null)

        val nativeLabel = view.findViewById<TextView>(R.id.nativeLabel)
        nativeLabel.setOnClickListener {
            viewTapped(context)
        }
    }

    private fun viewTapped(context: Context) {
        val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse("https://www.example.com/1"))
        context.startActivity(browserIntent)
    }
}
