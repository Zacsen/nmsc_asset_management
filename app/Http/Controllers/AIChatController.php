<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\AI\ChatService;

class AIChatController extends Controller
{
    public function index()
    {
        return inertia('AI/Index');
    }

    protected ChatService $chat;

    public function __construct(ChatService $chat)
    {
        $this->chat = $chat;
    }

    public function chat(Request $request)
    {
        $request->validate([
            'message' => 'required|string'
        ]);

        $reply = $this->chat->ask($request->message);

        return response()->json([
            'reply' => $reply
        ]);
    }
}
